package backend

import backend.IR.{Call, _}
import frontend.ast
import frontend.ast._
import backend.IRRegisters._

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

object IRTranslator {

  var calc_regs = List(ReturnRegister())
  var param_regs = List(paramReg1(), paramReg2(), paramReg3(), paramReg4(), paramReg5(), paramReg6())
  val stack_regs = List(BasePointer(), StackPointer())
  var scrap_regs = List(scratchReg1(), scratchReg2(), scratchReg3(), scratchReg4(), scratchReg5())

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):List[Block] = {
    translateFunc(prog.funcs, translateStatements(prog.stats, List(), symbolTable))
  }

  private def translateFunc(func:List[Func], currBlocks:List[Block]): List[Block] = currBlocks

  private def translateStatements(stmts:List[Stat], currBlocks:List[Block], symbolTable: mutable.Map[String, Type]):List[Block] = {
    // Code set-up
    val blockName = "main"
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(StackPointer()))
    val blocks = ListBuffer(currBlocks: _*)

    val regsToSave = symbolTable.keys.count(_.startsWith(s"$blockName-"))

    if (regsToSave == 0) {
      instructions.addOne(Push(scrap_regs.head))
    } else {
      instructions.addOne(SubImm(Immediate(8 * regsToSave), StackPointer()))
      for (regNo <- 0 to regsToSave) {
        instructions.addOne(MovRegister(scrap_regs(regNo), new Memory(Some(StackPointer()), None, None, Some(8 * regNo))))
      }
    }

    instructions += MovRegister(StackPointer(), BasePointer())

    stmts.flatMap {
      case Skip() => List.empty
      case Declaration(typ, x, y) => translateDeclaration(typ, x, y)
      case fun => fun match {
        case ast.Exit(expr) => {
          blocks.addOne(IR.Exit())
          evaluateExpr(expr).concat(List(Push(paramReg1()), MovRegister(ReturnRegister(), paramReg1()), Call(Label("exit")), Pop(paramReg1())))
        }
      }
    }.map(instr => instructions.addOne(instr))

    instructions += MovImm(Immediate(0), ReturnRegister())

    if (regsToSave == 0) {
      instructions.addOne(Pop(scrap_regs.head))
    } else {
      for (regNo <- regsToSave to 0) {
        instructions.addOne(MovRegister(scrap_regs(regNo), new Memory(Some(StackPointer()), None, None, Some(-8 * regNo))))
      }
    }

    // Finalise code
    instructions += Pop(BasePointer())
    instructions += Ret()

    blocks.addOne(new AsmBlock(Directive("text"), Label(blockName), instructions.toList)).reverse.toList
  }

  private def translateDeclaration(typ: Type, ident: Ident, RValue: RValue): List[Instruction] = {
    typ match {
      case IntType() => List(Ret())
      case _ => List(Ret())
    }
  }

  // Outputs code to evaluate an expression and put the result in the output register
  def evaluateExpr(expr: Expr): List[Instruction] = {
    expr match {
      case IntLit(x) => List(MovImm(Immediate(x), ReturnRegister()))
    }
  }

  private def getParams(stmt:Stat): Int = 1

  private def getParams(rVal:RValue): Int = {
    rVal match {
      case ast.Call(_, params) => params.length
      case _ => -1
    }
  }
}
