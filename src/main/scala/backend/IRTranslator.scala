package backend

import backend.IR._
import frontend.ast._
import backend.IRRegisters._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

object IRTranslator {

  var inFunc = false
  var labels = 0
  var blocks: ListBuffer[Block] = ListBuffer()
  var curBlock: AsmBlock = _

  var usedRegs = 0

  var scratchCounter = 0
  var varRegs: ListBuffer[varReg] = ListBuffer.empty
  var varCounter = 0
  var paramRegs: ListBuffer[paramReg] = ListBuffer.empty
  var paramCount = 0
  var roData: ReadOnlyData = new ReadOnlyData()

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty
  var scratchRegs: List[Register] = List(new scratchReg("foo1"), new scratchReg("foo2"), new scratchReg("foo3"), new scratchReg("foo4"),new scratchReg("foo5"))

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):List[Block] = {
    val ourProgram: ListBuffer[Block] = translateFuncs(prog.funcs, translateProgram(prog.stats, symbolTable), symbolTable)
    ourProgram.insert(0, roData)
    ourProgram.toList
  }

  private def translateFuncs(funcs:List[Func], currBlocks:ListBuffer[Block], symbolTable:mutable.Map[String, Type]): ListBuffer[Block] = {
    for (fun <- funcs) {
      variableMap = mutable.Map.empty
      varCounter = 0
      varRegs = ListBuffer.empty
      val funBlock = new AsmBlock(Directive(""), Label(s"wacc_${fun.ident.name}"), List.empty)
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
    val mainBlock = new AsmBlock(Directive("text"), Label("main"), setUpScope(symbolTable, "main-").toList)
    addBlock(mainBlock)
    curBlock = mainBlock
    translateStatements(stmts, symbolTable)
    revertSetUp(curBlock)
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
      instructions.addOne(MovInstr(rbx, Memory(StackPointer())))
      for (regNo <- 1 to usedRegs) {
        val newVarReg = new varReg(s"varReg${varRegs.length + 1}")
        instructions.addOne(MovInstr(newVarReg, Memory(StackPointer(), 8 * regNo)))
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
      instructions.addOne(MovInstr(Memory(StackPointer()), varRegs.head: varReg))
      for (regNo <- 1 to usedRegs) {
        instructions.addOne(MovInstr(Memory(StackPointer(), 8 * regNo), varRegs(regNo): varReg))
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
          translatePrint(checkType(expr)(symbolTable))
        case Println(expr) =>
          expr match {
            case StrLit(str) => roData.add(str)
            case _ =>
          }
          val instrs = translatePrint(checkType(expr)(symbolTable)).concat(List(CallInstr(Label("_println"))))
          addBlock(PrintlnBlock())
          instrs
        case If(cond, thenStat, elseStat) => {
          val thenLabel = getNewLabel()
          val restLabel = getNewLabel()
          val thenBlock = new AsmBlock(Directive(""), thenLabel, List.empty)
          val restBlock = new AsmBlock(Directive(""), restLabel, List.empty)

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
          val condBlock = new AsmBlock(Directive(""), condLabel, List.empty)
          val bodyBlock = new AsmBlock(Directive(""), bodyLabel, List.empty)
          val restBlock = new AsmBlock(Directive(""), restLabel, List.empty)

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
    varCounter += 1
    var instr:ListBuffer[Instruction] = ListBuffer.empty
    typ match {
      case IntType() | BoolType() => RValue match {
        case expr:Expr => instr = evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(MovInstr(ReturnRegister(), newReg)))
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
      case StrLit(str) =>
        roData.add(str)
        ListBuffer(MovInstr(Immediate(0), reg)) // TODO: Fix this
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
      case Ident(x) => ListBuffer(MovInstr(variableMap.get(x).orNull, reg))
    }
  }

  def translatePrint(typ:Type): List[Instruction] = {

    typ match {
      case CharType() => {
        val charPrintBlock = new AsmBlock(Directive(""), Label("_printc"), List.empty)
        val paramRegOne = getParamReg()
        val printInstrs: List[Instruction] = List(
          Push(BasePointer()),
          MovInstr(StackPointer(), BasePointer()),
          Align(StackPointer()),
          MovInstr(new scratchReg("dil"), new scratchReg("sil")),
          LeaInstr(Memory(new scratchReg("rip"), Label(".L._printc_str0")), new scratchReg("rdi")),
          MovInstr(Immediate(0), new scratchReg("al")),
          CallInstr(Label("printf@plt")),
          MovInstr(Immediate(0), new scratchReg("rdi")),
          CallInstr(Label("fflush@plt")),
          MovInstr(StackPointer(), BasePointer()),
          Pop(BasePointer()),
          Ret()
        )
        charPrintBlock.instructions = printInstrs
        blocks.addOne(charPrintBlock)
        printInstrs
      }

      case StringType() => {
        addBlock(PrintBlock())
        List(
          LeaInstr(Memory(new scratchReg("rip"), roData.prevString()), ReturnRegister()),
          Push(ReturnRegister()),
          Pop(ReturnRegister()),
          MovInstr(ReturnRegister(), ReturnRegister()),
          MovInstr(ReturnRegister(), new scratchReg("rdi")),
          CallInstr(Label("_prints"))
        )
      }

      case BoolType() => {
        val boolPrintBlock = new AsmBlock(Directive(""), Label("_printb"), List.empty)
        val printb0Block = new AsmBlock(Directive(""), Label(".L_printb0"), List.empty)
        val printb1Block = new AsmBlock(Directive(""), Label(".L_printb1"), List.empty)
        val paramRegOne = getParamReg()
        val scratchRegOne = new scratchReg(s"scratch${scratchRegs.length + 1}")
        val printInstrs: List[Instruction] = List(
          Push(BasePointer()),
          MovInstr(StackPointer(), BasePointer()),
          Align(StackPointer()),
          CmpInstr(Immediate(0), paramRegOne),
          JneInstr(Label(".L_printb0")),
          LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str0")), new scratchReg("rdx")),
          JumpInstr(Label(".L_printb1"))
        )
        val printb0Instrs: List[Instruction] = List(
          LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str1")), new scratchReg("rdx"))
        )
        val printb1Instrs: List[Instruction] = List(
          MovInstr(Memory(new scratchReg("rdx"), -4), new scratchReg("esi")),
          LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str2")), new scratchReg("rdi")),
          MovInstr(Immediate(0), new scratchReg("al")),
          CallInstr(Label("printf@plt")),
          MovInstr(Immediate(0), new scratchReg("rdi")),
          CallInstr(Label("fflush@plt")),
          MovInstr(BasePointer(), StackPointer()),
          Pop(BasePointer()),
          Ret()
        )
        boolPrintBlock.instructions = printInstrs
        printb0Block.instructions = printb0Instrs
        printb1Block.instructions = printb1Instrs
        blocks.addOne(boolPrintBlock)
        blocks.addOne(printb0Block)
        blocks.addOne(printb1Block)
        printInstrs
      }

      case IntType() => {
        val intPrintBlock = new AsmBlock(Directive(""), Label("_printi"), List.empty)
        val paramRegOne = getParamReg()
        val scratchRegOne = new scratchReg(s"scratch${scratchRegs.length + 1}")
        val printInstrs: List[Instruction] = List(
          Push(BasePointer()),
          MovInstr(StackPointer(), BasePointer()),
          Align(StackPointer()),
          MovInstr(paramRegOne, new scratchReg("esi")),
          LeaInstr(Memory(new scratchReg("rip"), Label(".L._printi_str0")), new scratchReg("rdi")),
          MovInstr(Immediate(0), new scratchReg("al")),
          CallInstr(Label("printf@plt")),
          MovInstr(Immediate(0), new scratchReg("rdi")),
          CallInstr(Label("fflush@plt")),
          MovInstr(BasePointer(), StackPointer()),
          Pop(BasePointer()),
          Ret()
        )
        intPrintBlock.instructions = printInstrs
        blocks.addOne(intPrintBlock)
        printInstrs
      }

      case ArrayType(elementType) => {
        val arrayTypePrintBlock = new AsmBlock(Directive(""), Label("PLACEHOLDER"), List.empty)
        val printInstrs: List[Instruction] = List.empty
        arrayTypePrintBlock.instructions = printInstrs
        blocks.addOne(arrayTypePrintBlock)
        printInstrs
      }

      case PairType(firstType, secondType) => {
        val pairTypePrintBlock = new AsmBlock(Directive(""), Label("PLACEHOLDER"), List.empty)
        val printInstrs: List[Instruction] = List.empty
        pairTypePrintBlock.instructions = printInstrs
        blocks.addOne(pairTypePrintBlock)
        printInstrs
      }
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

  private def addBlock(block: Block): Unit = {
    block match {
      case prt: PrintBlock => if (!blocks.map({ case b: AsmBlock => b.label case _ =>}).contains(prt.label)) {
        blocks.addOne(new PrintBlockROData())
        blocks.addOne(prt)
      }

      case prtLn: PrintlnBlock => if (!blocks.map({ case b: AsmBlock => b.label case _ => }).contains(prtLn.label)) {
        blocks.addOne(new PrintlnBlockROData())
        blocks.addOne(prtLn)
      }
      case asm: AsmBlock => if (!blocks.map({ case b: AsmBlock => b.label case _ =>}).contains(asm.label)) {
        blocks.addOne(block)
      }
    }
  }
}
