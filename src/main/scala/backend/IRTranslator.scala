package backend

import backend.IR._
import frontend.ast._
import backend.IRRegisters._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

object IRTranslator {

  var labels = 0
  var blocks: ListBuffer[Block] = ListBuffer()
  var curBlock: AsmBlock = null

  var usedRegs = 0

  var scratchRegs: ListBuffer[scratchReg] = ListBuffer.empty
  var scratchCounter = 0
  var paramRegs: ListBuffer[paramReg] = ListBuffer.empty
  var paramCount = 0

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):ListBuffer[Block] = {
    translateFuncs(prog.funcs, translateProgram(prog.stats, symbolTable), symbolTable)
  }

  private def translateFuncs(funcs:List[Func], currBlocks:ListBuffer[Block], symbolTable:mutable.Map[String, Type]): ListBuffer[Block] = {
    for (fun <- funcs) {
      variableMap = mutable.Map.empty
      scratchCounter = 0
      scratchRegs = ListBuffer.empty
      for (arg <- fun.paramList) {
        val paramReg = getParamReg()
        paramCount += 1
        variableMap.addOne(s"func-${fun.ident.name}-param-${arg.ident.name}", paramReg)
      }
      val setUp = setUpScope(symbolTable, s"func-${fun.ident.name}")
      paramCount = 0
      val funBlock = new AsmBlock(Directive(""), Label(s"wacc_${fun.ident.name}"), setUp.concat(translateStatements(fun.stats, symbolTable)).toList)
      currBlocks.addOne(funBlock)
      curBlock = funBlock
      revertSetUp(funBlock)
    }
    currBlocks
  }

  private def translateProgram(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]): ListBuffer[Block] = {
    blocks = ListBuffer()
    var instructions = setUpScope(symbolTable, "main-")
    instructions = instructions.concat(translateStatements(stmts, symbolTable))
    val mainBlock = new AsmBlock(Directive("text"), Label("main"), instructions.toList)
    if (curBlock == null) {
      revertSetUp(mainBlock)
    } else {
      revertSetUp(curBlock)
    }
    blocks.insert(0, mainBlock)
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
    instructions += MovInstr(Immediate(0), ReturnRegister())

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

  private def translateStatements(stmts:List[Stat], symbolTable: mutable.Map[String, frontend.ast.Type]):ListBuffer[Instruction] = {
    var statementsLeft = ListBuffer(stmts: _*)
    var instructions:ListBuffer[Instruction] = ListBuffer.empty
    for (stmt <- stmts) {
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
          val elseLabel = getNewLabel()
          blocks.addOne(new AsmBlock(Directive(""), thenLabel, translateStatements(thenStat, symbolTable).toList))
          val elseBlock = new AsmBlock(Directive(""), elseLabel, translateStatements(statementsLeft.toList, symbolTable).toList)
          blocks.addOne(elseBlock)
          curBlock = elseBlock
          evaluateExpr(cond, ReturnRegister()).concat(ListBuffer(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(thenLabel)))
            .concat(translateStatements(elseStat, symbolTable).addOne(JumpInstr(elseLabel)))
        }
        case While(cond, doStat) => {
          val conditionLabel = getNewLabel()
          val bodyLabel = getNewLabel()
          val restLabel = getNewLabel()
          blocks.addOne(new AsmBlock(Directive(""), bodyLabel, translateStatements(doStat, symbolTable).toList))
          blocks.addOne(new AsmBlock(Directive(""), conditionLabel, evaluateExpr(cond, ReturnRegister()).addOne(CmpInstr(ReturnRegister(), Immediate(1))).toList))
          val restBlock = new AsmBlock(Directive(""), restLabel, List(JeInstr(bodyLabel)))
          blocks.addOne(restBlock)
          curBlock = restBlock
          List(JumpInstr(conditionLabel))
        }
        case Return(expr) => evaluateExpr(expr, ReturnRegister())
        case fun => fun match {
          case Exit(expr) => {
            blocks.addOne(ExitBlock())
            val newParamReg = getParamReg()
            evaluateExpr(expr, ReturnRegister()).concat(ListBuffer(Push(newParamReg), MovInstr(ReturnRegister(), newParamReg), CallInstr(Label("_exit")), Pop(newParamReg)))
          }
        }
      })
    }

    instructions
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
            moveParams = moveParams.concat((evaluateExpr(arg, ReturnRegister()).addOne(MovInstr(ReturnRegister(), paramReg))))
          }
          paramCount = 0
          instr = moveParams.addOne(CallInstr(Label(name.name))).addOne(MovInstr(ReturnRegister(), newReg))
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

  private def getParams(stmt:Stat): Int = 1

  private def getParams(rVal:RValue): Int = {
    rVal match {
      case Call(_, params) => params.length
      case _ => -1
    }
  }
}
