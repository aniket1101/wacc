package backend

import backend.IR._
import frontend.ast._
import backend.IRRegisters._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

class IRTranslator(val prog: Prog, val symbolTable:mutable.Map[String, Type]) {

  var inFunc = false
  var labels = 0
  var blocks: ListBuffer[Block] = ListBuffer()
  var curBlock: AsmBlock = _

  var usedRegs = 0

  var scratchCounter = 0
  var varRegs: ListBuffer[varReg] = ListBuffer.empty
  val varMap: mutable.Map[String, varReg] = mutable.Map.empty
  var varCounter = 0
  var paramRegs: ListBuffer[paramReg] = ListBuffer.empty
  var paramCount = 0
  var roData: ReadOnlyData = new ReadOnlyData("")

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty
  var scratchRegs: List[Register] = List(new scratchReg("foo1"), new scratchReg("foo2"), new scratchReg("foo3"), new scratchReg("foo4"),new scratchReg("foo5"))

  def translate():List[Block] = {
    translateFuncs(prog.funcs, translateProgram(prog.stats, symbolTable), symbolTable).toList
  }

  private def translateFuncs(funcs:List[Func], currBlocks:ListBuffer[Block], symbolTable:mutable.Map[String, Type]): ListBuffer[Block] = {
    for (fun <- funcs) {
      variableMap = mutable.Map.empty
      varCounter = 0
      varRegs = ListBuffer.empty
      val funBlock = new AsmBlock(s"wacc_${fun.ident.name}", List.empty)
      curBlock = funBlock
      inFunc = true
      for (arg <- fun.paramList) {
        val paramReg = getParamReg()
        paramCount += 1
        variableMap.addOne(s"func-${fun.ident.name}-param-${arg.ident.name}", paramReg)
      }
      updateCurBlock(setUpScope(symbolTable, s"func-${fun.ident.name}").toList)
      paramCount = 0
      translateStatements(fun.stats, symbolTable)
      addBlock(funBlock)

      revertSetUp(funBlock)
    }
    currBlocks
  }

  private def updateCurBlock(instruction: Instruction): Unit = {
    updateCurBlock(List(instruction))
  }

  private def updateCurBlock(instructions: List[Instruction]): Unit = {
    curBlock.instructions = curBlock.instructions.concat(instructions)
  }


  private def translateProgram(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]): ListBuffer[Block] = {
    blocks = ListBuffer()
    val mainBlock = new AsmBlock("text", "main", setUpScope(symbolTable, "main-").toList)
    curBlock = mainBlock
    translateStatements(stmts, symbolTable)
    revertSetUp(curBlock)
    mainBlock.addROData(roData)
    blocks.insert(0, mainBlock)
    blocks
  }

  private def setUpScope(symbolTable: mutable.Map[String, Type], scopePrefix: String): ListBuffer[Instruction] = {
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(BasePointer()))
    usedRegs = symbolTable.keys.count(_.startsWith(scopePrefix)) - paramCount

    if (usedRegs == 0) {
      val rbx = new varReg("rbx")
      instructions.addOne(Push(rbx))
      varRegs += rbx
    } else {
      instructions.addOne(SubInstr(Immediate(8 * (usedRegs + 1)), StackPointer()))
      val rbx = new varReg("rbx")
      varRegs += rbx
      instructions.addOne(MovInstr(rbx, Memory(StackPointer(), 8)))
      for (regNo <- 1 to usedRegs) {
        val newVarReg = new varReg(s"varReg${varRegs.length + 1}")
        instructions.addOne(MovInstr(newVarReg, Memory(StackPointer(), 8 * regNo, 8)))
        varRegs += newVarReg
      }
    }

    instructions += MovInstr(StackPointer(), BasePointer())
    instructions
  }

  private def revertSetUp(block:AsmBlock): Unit = {
    val instructions: ListBuffer[Instruction] = ListBuffer.empty
    if (!inFunc) {
      instructions += MovInstr(Immediate(0), ReturnRegister())
    }

    if (usedRegs == 0) {
      instructions.addOne(Pop(varRegs.head: varReg))
    } else {
      instructions.addOne(MovInstr(Memory(StackPointer(), 8), varRegs.head: varReg))
      for (regNo <- 1 to usedRegs) {
        instructions.addOne(MovInstr(Memory(StackPointer(), 8 * regNo, 8), varRegs(regNo): varReg))
      }
      instructions.addOne(AddInstr(Immediate(8 * (usedRegs + 1)), StackPointer()))
    }

    // Finalise code
    instructions += Pop(BasePointer())
    instructions += Ret()
    block.instructions = block.instructions.concat(instructions)
  }

  private def translateStatements(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]):Unit = {
    var statementsLeft = ListBuffer(stmts: _*)
    var instructions:ListBuffer[Instruction] = ListBuffer.empty
    var reachedRestBlock = false
    for (stmt <- stmts if !reachedRestBlock) {
      statementsLeft = statementsLeft.tail
      instructions = instructions.concat(stmt match {
        case Skip() => List.empty
        case Declaration(typ, x, y) => translateDeclaration(typ, x, y)
        case Assign(Ident(x), rValue) => rValue match {
          case expr: Expr => evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(MovInstr(ReturnRegister(), variableMap.get(x).orNull)))
        }
        case Print(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          translatePrint(checkType(expr)(symbolTable), expr: Expr)
        case Println(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          val instrs = translatePrint(checkType(expr)(symbolTable), expr:Expr).concat(List(CallInstr(Label("_println"))))
          addBlock(PrintlnBlock())
          instrs
        case If(cond, thenStat, elseStat) => {
          val thenLabel = getNewLabel()
          val restLabel = getNewLabel()
          val thenBlock = new AsmBlock(thenLabel, List.empty)
          val restBlock = new AsmBlock(restLabel, List.empty)

          // Translating else block (adds statements to end of current block)
          updateCurBlock(evaluateExpr(cond, ReturnRegister()).concat(ListBuffer(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(thenLabel))).toList)
          translateStatements(elseStat, symbolTable)
          updateCurBlock(JumpInstr(restLabel))

          // Translating then block (new block)
          curBlock = thenBlock
          translateStatements(thenStat, symbolTable)
          updateCurBlock(JumpInstr(restLabel))

          // Translating rest block (new block)
          curBlock = restBlock
          translateStatements(statementsLeft.toList, symbolTable)

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

          updateCurBlock(JumpInstr(condLabel))

          // Translating Condition block (new block)
          curBlock = condBlock
          updateCurBlock(evaluateExpr(cond, ReturnRegister()).toList)
          updateCurBlock(List(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(bodyLabel), JumpInstr(restLabel)))

          // Translating Body block (new block)
          curBlock = bodyBlock
          translateStatements(doStat, symbolTable)
          updateCurBlock(JumpInstr(restLabel))

          // Translating Rest block (new block)
          curBlock = restBlock
          translateStatements(statementsLeft.toList, symbolTable)

          addBlock(condBlock)
          addBlock(bodyBlock)
          addBlock(restBlock)

          reachedRestBlock = true
          List.empty
        }
        case Return(expr) => evaluateExpr(expr, ReturnRegister())
        case Exit(expr) => {
          addBlock(ExitBlock())
          val newParamReg = getParamReg()
          evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(Push(newParamReg), MovInstr(ReturnRegister(), newParamReg), CallInstr(Label("_exit")), Pop(newParamReg)))
        }
        case Scope(stats) => {
          translateStatements(stats, symbolTable)
          List.empty
        }
      })
    }

    curBlock.instructions = curBlock.instructions.concat(instructions)
  }

  def translateDeclaration(typ: Type, ident: Ident, RValue: RValue): ListBuffer[Instruction] = {
    val newReg = varRegs(varCounter + 1)
    varMap(ident.name) = newReg
    varCounter += 1
    var instr:ListBuffer[Instruction] = ListBuffer.empty
    typ match {
      case IntType() | BoolType() | CharType() | StringType() => RValue match {
        case expr: Expr => instr = evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(MovInstr(ReturnRegister(), newReg)))
        case Call(name, args) => {
          var moveParams: ListBuffer[Instruction] = ListBuffer.empty
          for (arg <- args) {
            val paramReg = getParamReg()
            paramRegs += paramReg
            paramCount += 1
            moveParams = moveParams.concat((evaluateExpr(arg, ReturnRegister()).concat(ListBuffer(Push(paramReg), MovInstr(ReturnRegister(), paramReg)))))
          }
          instr = moveParams.addOne(CallInstr(Label(name.name))).addOne(MovInstr(ReturnRegister(), newReg))
          for (arg <- args) {
            paramCount -= 1
            val paramReg = getParamReg()
            moveParams = moveParams.addOne(Pop(paramReg))
          }
          paramCount = 0
        }
      }
      case _ => ListBuffer(Ret())
    }
    variableMap.addOne((ident.name, newReg))
    instr
  }

  // Outputs code to evaluate an expression and put the result in the given register
  def evaluateExpr(expr: Expr, reg:Register): ListBuffer[Instruction] = {
    expr match {
      case IntLit(x) => ListBuffer(MovInstr(Immediate(x), reg))
      case BoolLit(bool) => bool match {
        case true => ListBuffer(MovInstr(Immediate(1), reg))
        case _ => ListBuffer(MovInstr(Immediate(0), reg))
      }
      case CharLit(chr) => ListBuffer(MovInstr(Immediate(chr.toInt), reg))
      case StrLit(str) =>
        roData.add(str)
        ListBuffer(LeaInstr(Memory(new scratchReg("rip"), roData.prevString(), 4), reg),
          Push(reg), Pop(reg), MovInstr(reg, reg))
      case Ident(name) => ListBuffer(MovInstr(varMap(name), ReturnRegister()))
      case Add(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).addOne(AddInstr(reg, yReg))
        scratchCounter = 0
        instrs
      }
      case Sub(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).addOne(SubInstr(reg, yReg))
        scratchCounter = 0
        instrs
      }
      case Mul(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).addOne(MulInstr(reg, yReg))
        scratchCounter = 0
        instrs
      }
      case Mod(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).addOne(ModInstr(reg, yReg))
        scratchCounter = 0
        instrs
      }
      case GT(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveGT(reg)))
        scratchCounter = 0
        instrs
      }
      case GTE(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveGTE(reg)))
        scratchCounter = 0
        instrs
      }
      case LT(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveLT(reg)))
        scratchCounter = 0
        instrs
      }
      case LTE(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveLTE(reg)))
        scratchCounter = 0
        instrs
      }
      case Eq(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveEq(reg)))
        scratchCounter = 0
        instrs
      }
      case NEq(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchCounter + 1}")
        scratchCounter += 1
        val instrs = evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(CmpInstr(reg, yReg), MoveNEq(reg)))
        scratchCounter = 0
        instrs
      }
      case And(x, y) => {
        val shortCircuitLabel = getNewLabel()
        val shortCircuitBlock = new AsmBlock(shortCircuitLabel, List.empty)
        var instrs = evaluateExpr(x, reg).concat(List(CmpInstr(Immediate(1), reg), JneInstr(shortCircuitLabel))).concat(evaluateExpr(y, reg))
        instrs = instrs.concat(ListBuffer(CmpInstr(Immediate(1), reg), JumpInstr(shortCircuitLabel)))
        shortCircuitBlock.instructions = List(MoveEq(reg))
        updateCurBlock(instrs.toList)
        addBlock(shortCircuitBlock)
        curBlock = shortCircuitBlock
        ListBuffer.empty
      }
      case Or(x, y) => {
        val shortCircuitLabel = getNewLabel()
        val shortCircuitBlock = new AsmBlock(shortCircuitLabel, List.empty)
        var instrs = evaluateExpr(x, reg).concat(List(CmpInstr(Immediate(1), reg), JeInstr(shortCircuitLabel))).concat(evaluateExpr(y, reg))
        instrs = instrs.concat(ListBuffer(CmpInstr(Immediate(1), reg), JumpInstr(shortCircuitLabel)))
        shortCircuitBlock.instructions = List(MoveEq(reg))
        updateCurBlock(instrs.toList)
        addBlock(shortCircuitBlock)
        curBlock = shortCircuitBlock
        ListBuffer.empty
      }
      case Ident(x) => ListBuffer(MovInstr(variableMap.get(x).orNull, reg))
    }
  }

  def translatePrint(typ:Type, expr: Expr): List[Instruction] = {

    typ match {
      case CharType() => {
        addBlock(CharPrintBlock())
        expr match {
          case CharLit(chr) => 
            List(
              MovInstr(Immediate(chr), new scratchReg("rax")),
              MovInstr(new scratchReg("rax"), new scratchReg("rdi")),
              CallInstr(Label("_printc"))
            )
        }
      }

      case StringType() => {
        addBlock(StringPrintBlock())
        List(
          LeaInstr(Memory(new scratchReg("rip"), roData.prevString(), 4), ReturnRegister()),
          Push(ReturnRegister()),
          Pop(ReturnRegister()),
          MovInstr(ReturnRegister(), ReturnRegister()),
          MovInstr(ReturnRegister(), new scratchReg("rdi")),
          CallInstr(Label("_prints"))
        )
      }

      case BoolType() => {
        addBlock(BoolPrintBlock())
        addBlock(BoolPrintBlock0())
        addBlock(BoolPrintBlock1())
        val evalBool: List[Instruction] = expr match {
          case BoolLit(bl) =>
            List(MovInstr(Immediate(if (bl) 1 else 0), new scratchReg("rax")))
          case _ => evaluateExpr(expr, ReturnRegister()).toList
        }
        evalBool.concat(List(MovInstr(new scratchReg("rax"), new scratchReg("rdi")), CallInstr(Label("_printb")))).toList
      }

      case IntType() => {
        addBlock(IntPrintBlock())
        expr match {
          case IntLit(myInt) => 
            List(
              MovInstr(Immediate(myInt), new scratchReg("rax")),
              MovInstr(new scratchReg("rax"), new scratchReg("rdi")),
              CallInstr(Label("_printi"))
            )
        }
      }

//      case ArrayType(elementType) => {
//        val arrayTypePrintBlock = new AsmBlock(Directive(""), Label("PLACEHOLDER"), List.empty)
//        val printInstrs: List[Instruction] = List.empty
//        arrayTypePrintBlock.instructions = printInstrs
//        blocks.addOne(arrayTypePrintBlock)
//        printInstrs
//      }
//
//      case PairType(firstType, secondType) => {
//        val pairTypePrintBlock = new AsmBlock(Directive(""), Label("PLACEHOLDER"), List.empty)
//        val printInstrs: List[Instruction] = List.empty
//        pairTypePrintBlock.instructions = printInstrs
//        blocks.addOne(pairTypePrintBlock)
//        printInstrs
//      }
    }
  }

  def getParamReg(): paramReg = {
    if (paramCount >= paramRegs.length) {
      new paramReg(s"paramReg${paramRegs.length + 1}")
    } else {
      paramRegs(paramCount)
    }
  }

  private def getNewLabel(): Label = {
    labels += 1
    Label(s".L${labels-1}")
  }

  private def addBlock(block: AsmBlock): Unit = {
    if (!blocks.map({ case b: AsmBlock => b.label case _ =>}).contains(block.label)) {
      blocks.addOne(block)
    }

  }
}
