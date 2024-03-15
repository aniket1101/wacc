package backend

import backend.IR.{AddInstr, LeaInstr, _}
import frontend.ast._
import backend.IRRegisters._
import backend.Size._
import frontend.validator.checkType

import java.util.concurrent.atomic.AtomicInteger
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration.Duration.Inf
import scala.concurrent.{Await, Future}

class IRTranslator(val prog: Prog, val symbolTable:mutable.Map[String, Type], val concurrent:Boolean) {

  var mainState:State = null

  val nullPos: (Int, Int) = (-1, -1)
  val CHAR_RANGE_MASK = -128
  val regSize = 8

  var labels = new AtomicInteger(0)
  var blocks: ListBuffer[AsmBlock] = ListBuffer()

  var strCounter = new AtomicInteger(0)
  var strMap:mutable.Map[String, Int] = mutable.Map.empty
  var paramRegs:ListBuffer[paramReg] = ListBuffer.empty
  var scratchRegs:ListBuffer[Register] = ListBuffer.empty

  var roData: ReadOnlyData = new ReadOnlyData("")

  def translate():List[AsmBlock] = {
    if (concurrent) {
      val funcs = Future.apply(translateFuncsConcurrent(prog.funcs))
      val main = Future.apply(translateProgram(prog.stats))
      val result = for {
        fun <- funcs
        mainProcess <- main
      } yield (fun, mainProcess, blocks)
      Await.result(result, Inf)
    } else {
      translateProgram(prog.stats)
      translateFuncs(prog.funcs)
    }
    blocks.toList

  }

  private def translateFuncsConcurrent(funcs:List[Func]): ListBuffer[AsmBlock] = {
    funcs.foreach(fun => Future {
      translateFun(fun.stats, setUpFun(fun))
    })
    blocks
  }

  private def translateFuncs(funcs:List[Func]): Unit = {
    funcs.foreach(fun => translateFun(fun.stats, setUpFun(fun)))
  }

  private def translateFun(stats: List[Stat], state: State): Unit = {
    setUpScope(state.getScopePrefix(), state)
    translateStatements(stats, state)
  }

  private def setUpFun(fun:Func): State = {
    val varMap: mutable.Map[String, Register] = mutable.Map.empty
    val funBlock = new AsmBlock(s"${fun.ident.name}", List.empty)
    val scopePrefix: String = s"func-${fun.ident.name}"
    val funState = State(true, funBlock, varMap, scopePrefix)

    for (arg <- fun.paramList) {
      val paramReg = getParamReg(funState)
      funState.getVarMap().addOne(s"$scopePrefix-param-${arg.ident.name}", paramReg)
    }

    addBlock(funBlock)
    funState
  }

  private def updateCurBlock(instruction: Instruction, curBlock:AsmBlock): Unit = {
    updateCurBlock(List(instruction), curBlock)
  }

  private def updateCurBlock(instructions: List[Instruction], curBlock:AsmBlock): Unit = synchronized {
    curBlock.instructions = curBlock.instructions.concat(instructions)
  }


  private def translateProgram(stmts:List[Stat]): ListBuffer[AsmBlock] = {
    val mainBlock = new AsmBlock("text", "main", List.empty)
    val mainPrefix = "main-"
    mainState = State(false, mainBlock, mutable.Map.empty, mainPrefix)
    setUpScope(mainPrefix, mainState)
    mainState.curBlock = mainBlock
    translateStatements(stmts, mainState)
    revertSetUp(mainState)
    mainBlock.addROData(roData)
    blocks.insert(0, mainBlock)
    blocks
  }

  private def getMainParams():Int = {
    var max = 0
    for (func <- prog.funcs) {
      if (func.paramList.length > max) {
        max = func.paramList.length
      }
    }
    max
  }

  private def setUpScope(scopePrefix: String, state:State): Unit = {
    // Calculates how many variable registers we'll need
    val varRegs = symbolTable.keys.count(_.startsWith(scopePrefix)) - state.getParamCount()
    state.setUsedRegs(varRegs)

    state.addToVarRegs(BaseRegister())
    for (i <- 0 until varRegs) {
      val newVarReg = new varReg(state.getVarRegs().length)
      state.addToVarRegs(newVarReg)
    }

    // Make space for callee saved regs
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(BasePointer()))

    if (!state.getInFunc()) {
      state.setParamCount(getMainParams())
    }

    instructions += SaveCalleeRegs()
    instructions += MovInstr(StackPointer(), BasePointer())
    instructions += StackVarAlloc(varRegs, state.getParamCount())

    if (state.getInFunc()) {
      state.setParamCount(0)
    }

    state.curBlock.instructions = instructions.toList
  }

  private def revertSetUp(state:State): Unit = {
    val instructions: ListBuffer[Instruction] = ListBuffer.empty
    if (!state.getInFunc()) {
      instructions += MovInstr(Immediate(0), ReturnRegister())
    }

    instructions += StackVarReAlloc(state.getVarCounter())
    instructions += RecoverCalleeRegs()

    // Finalise code
    instructions += Ret()
    state.curBlock.instructions = state.curBlock.instructions.concat(instructions)
  }

  private def translateStatements(stmts:List[Stat], state:State):Unit = {
    var statementsLeft = ListBuffer(stmts: _*)
    var instructions:ListBuffer[Instruction] = ListBuffer.empty
    var reachedRestBlock = false
    for (stmt <- stmts if !reachedRestBlock) {
      statementsLeft = statementsLeft.tail
      instructions = instructions.concat(stmt match {
        case Skip() => List.empty
        case Declaration(typ, x, y) => translateDeclaration(typ, x, y, state)
        case AssignorInferDecl(Ident(x), rValue) =>
          var newReg: Register = null
          if (!state.getVarMap().contains(x)) {
            newReg = state.getVarRegs()(state.getVarCounter() + 1)
            state.incrementVarCounter()
            state.getVarMap().addOne((x, newReg))
          } else {
            newReg = state.getFromVarMap(x)
          }
          rValue match {
          case expr: Expr => evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(ListBuffer(MovInstr(ReturnRegister(), state.getFromVarMap(x))))
          case Call(name, args) => {

            // If we're in a function, sub the stack pointer and 'push' arguments
            // For every arg:
            // Evaluate into rax
            // Move rax into param register
            // Revert
            var instr: ListBuffer[Instruction] = ListBuffer.empty
            if (state.getInFunc()) {
              val oldParam = state.getParamCount()
              var argCounter = 0
              state.setParamCount(args.length)
              instr += SubInstr(Immediate(args.length * regSize), StackPointer())
              for (arg <- args) {
                state.decrementParamCounter()
                val param = getParamReg(state)
                state.decrementParamCounter()
                instr += MovInstr(param, Memory(StackPointer(), regSize * argCounter))
                argCounter += 1
              }
              state.setParamCount(oldParam)
            }
            state.setParamCount(0)
            for (arg <- args) {
              val paramReg = getParamReg(state)
              instr = instr.concat(evaluateExpr(arg, ReturnRegister(), BIT_64 ,state).addOne(MovInstr(ReturnRegister(), paramReg)))
            }
            instr += CallInstr(Label(name.name))
            instr += MovInstr(ReturnRegister(), newReg)
            instr += RecoverStackPointer(args.length)
            if (state.getInFunc()) {
              val oldParam = state.getParamCount()
              var argCounter = 0
              state.setParamCount(args.length)
              for (arg <- args) {
                state.decrementParamCounter()
                val param = getParamReg(state)
                state.decrementParamCounter()
                instr += MovInstr(Memory(StackPointer(), regSize * argCounter), param)
                argCounter += 1
              }
              instr += AddInstr(Immediate(args.length * regSize), StackPointer())
              state.setParamCount(oldParam)
            }

            instr

          }
          case _ => evaluateRValue(rValue, state.getFromVarMap(x), x, checkType(rValue)(symbolTable, List()), state)
        }
        case Read(v: Ident) =>
          translateRead(checkType(v)(symbolTable), v, state)
        case Free(_) => List()
        case Print(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          translatePrint(checkType(expr)(symbolTable), expr: Expr, state).concat(ListBuffer(PopParamRegs()))
        case Println(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          var instrs = translatePrint(checkType(expr)(symbolTable), expr: Expr, state).concat(List(CallInstr(Label("_println"))))
          addBlock(PrintlnBlock())
          instrs = instrs.concat(ListBuffer(PopParamRegs()))
          instrs
        case Read(ident: Ident) =>
          translateRead(checkType(ident: Expr)(symbolTable), ident, state)

        case If(cond, thenStat, elseStat) => {
          val thenLabel = getNewLabel()
          val restLabel = getNewLabel()
          val thenBlock = new AsmBlock(thenLabel, List.empty)
          val restBlock = new AsmBlock(restLabel, List.empty)

          // Translating else block (adds statements to end of current block)
          updateCurBlock(instructions.toList, state.curBlock)
          instructions = ListBuffer.empty
          updateCurBlock(evaluateExpr(cond, ReturnRegister(), BIT_64, state).concat(ListBuffer(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(thenLabel))).toList, state.curBlock)
          translateStatements(elseStat, state)
          updateCurBlock(JumpInstr(restLabel), state.curBlock)

          // Translating then block (new block)
          state.curBlock = thenBlock
          translateStatements(thenStat, state)
          updateCurBlock(JumpInstr(restLabel), state.curBlock)

          // Translating rest block (new block)
          state.curBlock = restBlock
          translateStatements(statementsLeft.toList, state)

          addBlock(thenBlock)
          addBlock(restBlock)

          reachedRestBlock = true

          List.empty
        }
        case While(cond, doStat) => {
          val condLabel = getNewLabel()
          val bodyLabel = getNewLabel()
          val restLabel = getNewLabel()
          val condBlock = new AsmBlock("", condLabel, List.empty)
          val bodyBlock = new AsmBlock("", bodyLabel.name, List.empty)
          val restBlock = new AsmBlock("", restLabel.name, List.empty)

          updateCurBlock(instructions.toList, state.curBlock)
          instructions = ListBuffer.empty
          updateCurBlock(JumpInstr(condLabel), state.curBlock)

          // Translating Condition block (new block)
          state.curBlock = condBlock
          updateCurBlock(evaluateExpr(cond, ReturnRegister(), BIT_64, state).toList, state.curBlock)
          updateCurBlock(List(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(bodyLabel), JumpInstr(restLabel)), state.curBlock)

          // Translating Body block (new block)
          state.curBlock = bodyBlock
          translateStatements(doStat, state)
          updateCurBlock(JumpInstr(condLabel), state.curBlock)

          // Translating Rest block (new block)
          state.curBlock = restBlock
          translateStatements(statementsLeft.toList, state)

          addBlock(condBlock)
          addBlock(bodyBlock)
          addBlock(restBlock)

          reachedRestBlock = true
          List.empty
        }
        case Exit(expr) => {
          addBlock(ExitBlock())
          val newParamReg = getParamReg(state)
          state.incrementParamCounter()
          evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(ListBuffer(Push(newParamReg), MovInstr(ReturnRegister(), newParamReg), CallInstr(Label("_exit")), Pop(newParamReg)))
        }
        case Scope(stats) => {
          updateCurBlock(instructions.toList, state.curBlock)
          translateStatements(stats, state)
          instructions = ListBuffer.empty
          List.empty
        }
        case Return(expr) => {
          val instrs = evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(ListBuffer(StackVarReAlloc(state.getVarCounter()), RecoverCalleeRegs(), Ret()))
          reachedRestBlock = true
          instrs
        }
      })
      stmt match {
        case Scope(_) | If(_, _, _) | While(_, _) => instructions = ListBuffer.empty
        case _ =>
      }
    }
    state.curBlock.instructions = state.curBlock.instructions.concat(instructions)
  }

  def translateDeclaration(typ: Type, ident: Ident, rValue: RValue, state:State): ListBuffer[Instruction] = {
    state.incrementVarCounter()
    val newReg = state.getVarRegs()(state.getVarCounter())
    var instr:ListBuffer[Instruction] = ListBuffer.empty
    typ match {
      case IntType() | BoolType() | CharType() | StringType() => rValue match {
        case expr: Expr => instr = evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(ListBuffer(MovInstr(ReturnRegister(), newReg)))
        case Call(name, args) => {
          // If we're in a function, sub the stack pointer and 'push' arguments
          // For every arg:
          // Evaluate into rax
          // Move rax into param register
          // Revert
          if (state.getInFunc()) {
            val oldParam = state.getParamCount()
            var argCounter = 0
            state.setParamCount(args.length)
            instr += SubInstr(Immediate(args.length * regSize), StackPointer())
            for (arg <- args) {
              state.decrementParamCounter()
              val param = getParamReg(state)
              state.decrementParamCounter()
              instr += MovInstr(param, Memory(StackPointer(), regSize * argCounter))
              argCounter += 1
            }
            state.setParamCount(oldParam)
          }
          state.setParamCount(0)
          for (arg <- args) {
            val paramReg = getParamReg(state)
            instr = instr.concat(evaluateExpr(arg, ReturnRegister(), BIT_64 ,state).addOne(MovInstr(ReturnRegister(), paramReg)))
          }
          instr += CallInstr(Label(name.name))
          instr += MovInstr(ReturnRegister(), newReg)
          instr += RecoverStackPointer(args.length)
          if (state.getInFunc()) {
            val oldParam = state.getParamCount()
            var argCounter = 0
            state.setParamCount(args.length)
            for (arg <- args) {
              state.decrementParamCounter()
              val param = getParamReg(state)
              state.decrementParamCounter()
              instr += MovInstr(Memory(StackPointer(), regSize * argCounter), param)
              argCounter += 1
            }
            instr += AddInstr(Immediate(args.length * regSize), StackPointer())
            state.setParamCount(oldParam)
          }
        }
      }
      case ArrayType(_) => instr = evaluateRValue(rValue, newReg, ident.name, typ, state)
      case _ => ListBuffer(Ret())
    }
    typ match {
      case StringType() => {
        addString(ident.name)
      }
      case _ =>
    }
    state.getVarMap().addOne((ident.name, newReg))
    instr
  }

  def evaluateRValue(rValue: RValue, reg: Register, ident: String, typ: Type, state:State): ListBuffer[Instruction] = {
    rValue match {
      case expr: Expr => evaluateExpr(expr, reg, BIT_64, state).concat(ListBuffer(MovInstr(ReturnRegister(), state.getFromVarMap(ident))))
      case ArrayLit(xs) => {
        addBlock(MallocBlock())
        addBlock(errOutOfMemory())
        addBlock(errOverflow())
        addBlock(StringPrintBlock())

        val typSize = typ match {
          case ArrayType(innerType) => innerType match {
            case IntType() => 4
            case CharType() => 1
            case _ => 4
          }
          case IntType() => 4
          case CharType() => 1
          case _ => 4
        }

        val wordType = typSize match {
          case 8 => BIT_64
          case 4 => BIT_32
          case 2 => BIT_16
          case 1 => BIT_8
        }

        val mallocReg = new scratchReg(state.getScratchCounter(), 0)
        state.incrementScratchCounter()
        var instr: ListBuffer[Instruction] = ListBuffer(
          MovInstr(Immediate((xs.length) * typSize + 4), DestinationRegister()).changeSize(BIT_32),
          CallInstr(Label("_malloc")),
          MovInstr(ReturnRegister(), mallocReg),
          LeaInstr(Memory(mallocReg, 4), mallocReg),
          MovInstr(Immediate(xs.length), ReturnRegister()),
          MovInstr(ReturnRegister(), Memory(mallocReg, -4)).changeSize(BIT_32)
        )
        for (i <- xs.indices) {
          val addOffset = typSize * i
          val x: Expr = xs(i)
          val movInstr = if (addOffset == 0) MovInstr(ReturnRegister(), Memory(mallocReg)).changeSize(wordType)
          else MovInstr(ReturnRegister(), Memory(mallocReg, addOffset)).changeSize(wordType)
          val addElem = evaluateExpr(x, ReturnRegister(), BIT_64, state).concat(List(movInstr))
          instr = instr.concat(addElem)
        }
        instr = instr.concat(ListBuffer(MovInstr(mallocReg, reg)))
        state.setScratchCounter(0)
        instr
      }
    }
  }

  // Outputs code to evaluate an expression and put the result in the given register
  def evaluateExpr(expr: Expr, reg:Register, size: Size, state:State): ListBuffer[Instruction] = {
    expr match {
      case IntLit(x) => ListBuffer(MovInstr(Immediate(x), reg).changeSize(size))
      case BoolLit(bool) => bool match {
        case true => ListBuffer(MovInstr(Immediate(1), reg).changeSize(size))
        case _ => ListBuffer(MovInstr(Immediate(0), reg).changeSize(size))
      }
      case CharLit(chr) => ListBuffer(MovInstr(Immediate(chr.toInt), reg).changeSize(size))
      case StrLit(str) =>
        roData.add(str)
        ListBuffer(LeaInstr(Memory(InstrPtrRegister(), roData.prevString()), reg).changeSize(size),
          Push(reg), Pop(reg), MovInstr(reg, reg))
      case Ident(name) => ListBuffer(MovInstr(state.getFromVarMap(name), reg).changeSize(size))
      case Neg(x) => evaluateExpr(new Sub(IntLit(0)(nullPos), x)(nullPos), reg, size, state)
      case Chr(x) => {
        addBlock(errBadChar())
        val evalChar: ListBuffer[Instruction] = x match {
          case IntLit(x) =>
            ListBuffer(MovInstr(Immediate(x), reg).changeSize(size))
          case _ =>
            evaluateExpr(x, reg, BIT_64, state)
        }
        evalChar.concat(List(
          TestInstr(Immediate(CHAR_RANGE_MASK), reg).changeSize(size),
          CMovNeInstr(ReturnRegister(), SourceRegister()),
          JneInstr(Label("_errBadChar"))
        ))
      }
      case Ord(x) =>
        evaluateExpr(x, reg, BIT_64, state)
      case Len(x) =>
        evaluateExpr(x, reg, BIT_64, state).concat(List(MoveSXInstr(Memory(reg, -4), reg, BIT_32, BIT_64)))
      case Add(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        (x, y) match {
          case (IntLit(i), j) => evaluateExpr(j, reg, size, state).concat(List(AddInstr(Immediate(i), reg).changeSize(size)))
          case (i, IntLit(j)) => evaluateExpr(i, reg, size, state).concat(List(AddInstr(Immediate(j), reg).changeSize(size)))
          case _ =>
            val yReg = getScratchReg(state)
            val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).addOne(AddInstr(yReg, reg).changeSize(size))
            state.setScratchCounter(1)
            instrs
        }
      }

      case Sub(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).addOne(SubInstr(yReg, reg).changeSize(size))
        state.setScratchCounter(1)
        instrs
      }
      case Mul(x, y) => {
        addBlock(errOverflow())
        addBlock(StringPrintBlock())
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).addOne(MulInstr(yReg, reg).changeSize(size))
        state.setScratchCounter(1)
        instrs
      }
      case Div(x, y) => {
        addBlock(errDivZero())
        addBlock(StringPrintBlock())
        val tempReg = getScratchReg(state)
        val yReg = getScratchReg(state)
        val instrs = ListBuffer(MovInstr(ReturnRegister(), tempReg)).concat(evaluateExpr(x, ReturnRegister(), BIT_32, state)).concat(evaluateExpr(y, yReg, BIT_32, state)).concat(List(
          DivInstr(yReg, reg).changeSize(BIT_32)
        ))//.concat(ListBuffer(MovInstr(ReturnRegister(), reg)))
        state.setScratchCounter(1)
        instrs
      }

      case Mod(x, y) => {
        addBlock(errDivZero())
        addBlock(StringPrintBlock())
        val tempReg = getScratchReg(state)
        val yReg = getScratchReg(state)
        val instrs = ListBuffer(MovInstr(ReturnRegister(), tempReg)).concat(evaluateExpr(x, ReturnRegister(), BIT_32, state)).concat(evaluateExpr(y, yReg, BIT_32, state)).concat(List(
          ModInstr(yReg, reg).changeSize(BIT_32)
        )) //.concat(ListBuffer(MovInstr(ReturnRegister(), reg)))
        state.setScratchCounter(1)
        instrs
      }
      case GT(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveGT(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case GTE(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveGTE(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case LT(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveLT(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case LTE(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveLTE(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case Eq(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveEq(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case NEq(x, y) => {
        val yReg = getScratchReg(state)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).concat(ListBuffer(CmpInstr(yReg, reg).changeSize(size), MoveNEq(reg)))
        state.setScratchCounter(1)
        instrs
      }
      case And(x, y) => {
        val yReg = new scratchReg(state.getScratchCounter(), 0)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).addOne(AndInstr(reg, yReg, BIT_8))
        instrs
      }
      case Or(x, y) => {
        val yReg = new scratchReg(state.getScratchCounter(), 0)
        val instrs = evaluateExpr(x, reg, size, state).concat(evaluateExpr(y, yReg, size, state)).addOne(OrInstr(reg, yReg, BIT_8))
        instrs
      }
      case Not(bool) => evaluateExpr(bool, reg, BIT_64, state).addOne(NotInstr(reg))
      case Ident(x) => ListBuffer(MovInstr(state.getFromVarMap(x), reg))
    }
  }

  def translateRead(typ:Type, v: Ident, state:State): List[Instruction] = {
    typ match {
      case IntType() =>
        addBlock(ReadIntBlock())
          val vReg = state.getFromVarMap(v.name)
        List(
          MovInstr(vReg, ReturnRegister()),
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_readi")),
          MovInstr(ReturnRegister(), vReg)
        )
      case CharType() =>
        addBlock(ReadCharBlock())
        val vReg = state.getFromVarMap(v.name)
        List(
          MovInstr(vReg, ReturnRegister()),
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_readc")),
          MovInstr(ReturnRegister(), vReg)
        )
    }
  }

  def pushParamRegs(): ListBuffer[Instruction] = {
    var instrs: ListBuffer[Instruction] = ListBuffer.empty
    for (reg <- paramRegs) {
      instrs = instrs.addOne(Push(reg))
    }
    instrs
  }

  def popParamRegs(): ListBuffer[Instruction] = {
    var instrs: ListBuffer[Instruction] = ListBuffer.empty
    for (reg <- paramRegs) {
      instrs = instrs.addOne(Pop(reg))
    }
    instrs
  }

  def translatePrint(typ:Type, expr: Expr, state:State): List[Instruction] = {
    var instructions: List[Instruction] = List(PushParamRegs())
    instructions = instructions.concat(typ match {
      case CharType() => {
        addBlock(CharPrintBlock())
        val evalChar: List[Instruction] = expr match {
          case CharLit(chr) =>
            List(MovInstr(Immediate(chr), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64, state).toList
        }
        evalChar.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_printc"))
        ))
      }

      case StringType() => {
        addBlock(StringPrintBlock())
        val evalStr: List[Instruction] = expr match {
          case Ident(name) =>
            List(MovInstr(state.getVarMap().getOrElse(name, ReturnRegister()), ReturnRegister()), LeaInstr(Memory(InstrPtrRegister(), roData.get(strMap(name))), ReturnRegister()))
          case _ => List(LeaInstr(Memory(InstrPtrRegister(), roData.prevString()), ReturnRegister()))
        }
        evalStr.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_prints"))
        ))
      }

      case BoolType() => {
        addBlock(BoolPrintBlock())
        addBlock(BoolPrintBlock0())
        addBlock(BoolPrintBlock1())
        val evalBool: List[Instruction] = expr match {
          case BoolLit(bl) =>
            List(MovInstr(Immediate(if (bl) 1 else 0), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64, state).toList
        }
        evalBool.concat(List(MovInstr(ReturnRegister(), DestinationRegister()), CallInstr(Label("_printb")))).toList
      }

      case IntType() => {
        addBlock(IntPrintBlock())
        val evalInt: List[Instruction] = expr match {
          case IntLit(myInt) => List(MovInstr(Immediate(myInt), ReturnRegister()))
          case _ => evaluateExpr(expr, ReturnRegister(), BIT_64, state).toList
        }
        evalInt.concat(List(
          MovInstr(ReturnRegister(), DestinationRegister()),
          CallInstr(Label("_printi"))))
      }

      case ArrayType(innerType) => {
        innerType match {
          case CharType() => addBlock(StringPrintBlock())
            evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(List(
              MovInstr(ReturnRegister(), DestinationRegister()),
              CallInstr(Label("_prints"))
            )).toList
          case _ => addBlock(PointerPrintBlock())
            evaluateExpr(expr, ReturnRegister(), BIT_64, state).concat(List(
              MovInstr(ReturnRegister(), DestinationRegister()),
              CallInstr(Label("_printp"))
            )).toList
        }
      }

      case _ => List()
    })
    instructions
  }

  def getRegsUsed(): Int = {
    mainState.usedRegs + paramRegs.length
  }

  def getParamReg(state:State): paramReg = {
    if (state.paramCount >= paramRegs.length) {
      state.incrementParamCounter()
      val reg = new paramReg(paramRegs.length)
      paramRegs += reg
      reg
    } else {
      val reg = paramRegs(state.paramCount)
      state.incrementParamCounter()
      reg
    }
  }

  def getScratchReg(state:State): Register = {
    if (state.getScratchCounter() >= scratchRegs.length) {
      state.incrementScratchCounter()
      val reg = new scratchReg(scratchRegs.length, 0)
      scratchRegs += reg
      reg
    } else {
      val reg = scratchRegs(state.getScratchCounter())
      state.incrementScratchCounter()
      reg
    }
  }

  private def getNewLabel(): Label = synchronized {
    labels.addAndGet(1)
    Label(s".L${labels.get()-1}")
  }

  private def addBlock(block: AsmBlock): Unit = synchronized {
    if (!blocks.map({ case b: AsmBlock => b.label case _ =>}).contains(block.label)) {
      blocks.addOne(block)
    }
  }

  private def addString(str: String): Unit = synchronized {
    strMap = strMap.addOne((str, strCounter.getAndIncrement()))
  }
}
