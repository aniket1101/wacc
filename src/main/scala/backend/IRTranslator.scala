package backend

import backend.IR._
import frontend.ast._
import backend.IRRegisters._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

object IRTranslator {

  var labels = 0
  var scrap_regs = List(scratchReg1(), scratchReg2(), scratchReg3(), scratchReg4(), scratchReg5())

  var variableMap: mutable.Map[String, Register] = mutable.Map.empty

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):List[Block] = {
    translateFunc(prog.funcs, translateStatements(prog.stats, List(), symbolTable))
  }

  private def translateFunc(func:List[Func], currBlocks:List[Block]): List[Block] = currBlocks

  private def translateStatements(stmts:List[Stat], currBlocks:List[Block], symbolTable: mutable.Map[String, frontend.ast.Type]):List[Block] = {
    // Code set-up
    val blockName = "main"
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(BasePointer()))
    val blocks = ListBuffer(currBlocks: _*)

    val regsToSave = symbolTable.keys.count(_.startsWith(s"$blockName-"))

    if (regsToSave == 0) {
      instructions.addOne(Push(scrap_regs.head))
    } else {
      instructions.addOne(SubInstr(Immediate(8 * (regsToSave + 1)), StackPointer()))
      instructions.addOne(MovInstr(scrap_regs.head, Memory(StackPointer())))
      for (regNo <- 1 to regsToSave) {
        instructions.addOne(MovInstr(scrap_regs(regNo), Memory(StackPointer(), 8 * regNo)))
      }
    }

    instructions += MovInstr(StackPointer(), BasePointer())

    stmts.flatMap {
      case Skip() => List.empty
      case Declaration(typ, x, y) => translateDeclaration(typ, x, y)
      case Assign(Ident(x), rValue) => rValue match {
        case expr:Expr => evaluateExpr(expr, ReturnRegister()).concat(List(MovInstr(ReturnRegister(), variableMap.get(x).orNull)))
      }
      case Print(expr) => translatePrint(checkType(expr)(symbolTable))
      case If(cond, thenStat, elseStat) => {
        val thenLabel = getNewLabel()
        val elseLabel = getNewLabel()
        blocks.addOne(new AsmBlock(Directive(""), elseLabel, List.empty))
        blocks.addOne(new AsmBlock(Directive(""), thenLabel, List.empty))
        evaluateExpr(cond, ReturnRegister()).concat(List(CmpInstr(Immediate(1), ReturnRegister()), JeInstr(thenLabel), JumpInstr(elseLabel)))
      }
      case fun => fun match {
        case Exit(expr) => {
          blocks.addOne(ExitBlock())
          evaluateExpr(expr, ReturnRegister()).concat(List(Push(paramReg1()), MovInstr(ReturnRegister(), paramReg1()), CallInstr(Label("_exit")), Pop(paramReg1())))
        }
      }
    }.map(instr => instructions.addOne(instr))

    instructions += MovInstr(Immediate(0), ReturnRegister())

    if (regsToSave == 0) {
      instructions.addOne(Pop(scrap_regs.head))
    } else {
      instructions.addOne(MovInstr(Memory(StackPointer()), scrap_regs.head))
      for (regNo <- 1 to regsToSave) {
        instructions.addOne(MovInstr(Memory(StackPointer(), 8 * regNo), scrap_regs(regNo)))
      }
      instructions.addOne(AddInstr(Immediate(8 * (regsToSave + 1)), StackPointer()))
    }

    // Finalise code
    instructions += Pop(BasePointer())
    instructions += Ret()

    blocks.addOne(new AsmBlock(Directive("text"), Label(blockName), instructions.toList)).reverse.toList
  }

  def translateDeclaration(typ: Type, ident: Ident, RValue: RValue): List[Instruction] = {
    val newReg = new Register("reg1")
    var instr:List[Instruction] = List.empty
    typ match {
      case IntType() => RValue match {
        case expr:Expr => instr = evaluateExpr(expr, ReturnRegister()).concat(List(MovInstr(ReturnRegister(), newReg)))
      }
      case _ => List(Ret())
    }
    variableMap.addOne((ident.name, newReg))
    instr
  }

  // Outputs code to evaluate an expression and put the result in the given register
  def evaluateExpr(expr: Expr, reg:Register): List[Instruction] = {
    expr match {
      case IntLit(x) => List(MovInstr(Immediate(x), reg))
      case BoolLit(bool) => bool match {
        case true => List(MovInstr(Immediate(1), reg))
        case _ => List(MovInstr(Immediate(0), reg))
      }
      case Add(x, y) => {
        val yReg = new Register("reg")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(List(AddInstr(reg, yReg)))
      }
      case Sub(x, y) => {
        val yReg = new Register("reg")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(List(SubInstr(reg, yReg)))
      }
      case Mul(x, y) => {
        val yReg = new Register("reg2")
        evaluateExpr(x, reg).concat(evaluateExpr(y, yReg)).concat(List(MulInstr(reg, yReg)))
      }
      case Ident(x) => List(MovInstr(variableMap.get(x).orNull, reg))
    }
  }

  private def translatePrint(typ:Type):List[Instruction] = ???

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
