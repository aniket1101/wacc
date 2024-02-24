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
  var blocks: ListBuffer[AsmBlock] = ListBuffer()
  var curBlock: AsmBlock = _

  var usedRegs = 0

  var scratchRegs: ListBuffer[scratchReg] = ListBuffer.empty
  var scratchCounter = 0
  var paramRegs: ListBuffer[paramReg] = ListBuffer.empty
  var paramCount = 0

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):ListBuffer[AsmBlock] = {
    translateFuncs(prog.funcs, translateProgram(prog.stats, symbolTable), symbolTable)
  }

  private def translateFuncs(funcs:List[Func], currBlocks:ListBuffer[AsmBlock], symbolTable:mutable.Map[String, Type]): ListBuffer[AsmBlock] = {
    for (fun <- funcs) {
      variableMap = mutable.Map.empty
      scratchCounter = 0
      scratchRegs = ListBuffer.empty
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

  private def translateProgram(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]): ListBuffer[AsmBlock] = {
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
      val rbx = new scratchReg("rbx")
      instructions.addOne(Push(rbx))
      scratchRegs += rbx
    } else {
      instructions.addOne(SubInstr(Immediate(8 * (usedRegs + 1)), StackPointer()))
      val rbx = new scratchReg("rbx")
      scratchRegs += rbx
      instructions.addOne(MovInstr(rbx, Memory(StackPointer())))
      for (regNo <- 1 to usedRegs) {
        val newScratchReg = new scratchReg(s"scratchReg${scratchRegs.length + 1}")
        instructions.addOne(MovInstr(newScratchReg, Memory(StackPointer(), 8 * regNo)))
        scratchRegs += newScratchReg
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
      instructions.addOne(Pop(scratchRegs.head: scratchReg))
    } else {
      instructions.addOne(MovInstr(Memory(StackPointer()), scratchRegs.head: scratchReg))
      for (regNo <- 1 to usedRegs) {
        instructions.addOne(MovInstr(Memory(StackPointer(), 8 * regNo), scratchRegs(regNo): scratchReg))
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
        case Print(expr) => translatePrint(checkType(expr)(symbolTable))
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
        case fun => fun match {
          case Exit(expr) => {
            addBlock(ExitBlock())
            val newParamReg = getParamReg()
            evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(Push(newParamReg), MovInstr(ReturnRegister(), newParamReg), CallInstr(Label("_exit")), Pop(newParamReg)))
          }
        }
      })
    }

    curBlock.instructions = curBlock.instructions.concat(instructions)
  }

  def translateDeclaration(typ: Type, ident: Ident, RValue: RValue): ListBuffer[Instruction] = {
    val newReg = scratchRegs(scratchCounter + 1)
    scratchCounter += 1
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
      case Add(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchRegs.length}")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(AddInstr(reg, yReg)))
      }
      case Sub(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchRegs.length}")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(SubInstr(reg, yReg)))
      }
      case Mul(x, y) => {
        val yReg = new scratchReg(s"scratchReg${scratchRegs.length}")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(ListBuffer(MulInstr(reg, yReg)))
      }
      case Ident(x) => ListBuffer(MovInstr(variableMap.get(x).orNull, reg))
    }
  }

  private def translatePrint(typ:Type):ListBuffer[Instruction] = ???

  private def updateCurBlock(instruction: Instruction): Unit = {
    updateCurBlock(List(instruction))
  }

  private def updateCurBlock(instructions: List[Instruction]): Unit = {
    curBlock.instructions = curBlock.instructions.concat(instructions)
  }
  private def getParamReg(): paramReg = {
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

  private def addBlock(block: AsmBlock) = {
    if (!blocks.map(block => block.label).contains(block.label)) {
      blocks.addOne(block)
    }
  }
}
