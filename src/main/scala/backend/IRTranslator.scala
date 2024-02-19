package backend

import backend.IR._
import frontend.ast._

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

object IRTranslator {

  private val calleeRegistersToSave = List(Register("rbx"), Register("r10"), Register("r11"), Register("r12"), Register("r13"), Register("r14"), Register("15"))

  def translateAST(prog: Prog, symbolTable:mutable.Map[String, Type]):List[Block] = {
    translateFunc(prog.funcs, translateStatements(prog.stats, List(), symbolTable))
  }

  private def translateFunc(func:List[Func], currBlocks:List[Block]): List[Block] = currBlocks

  private def translateStatements(stmts:List[Stat], currBlocks:List[Block], symbolTable: mutable.Map[String, Type]):List[Block] = {
    // Code set-up
    val blockName = "main"
    val instructions: ListBuffer[Instruction] = ListBuffer(Push(Register("rbp")))

    val regsToSave = symbolTable.keys.count(_.startsWith(s"$blockName-"))

    if (regsToSave == 0) {
      instructions.addOne(Push(Register("rbx")))
    } else {
      instructions.addOne(SubImm(Immediate(8 * regsToSave), Register("rsp")))
      for (regNo <- 0 to regsToSave) {
        instructions.addOne(MovRegister(calleeRegistersToSave(regNo), Memory(Register("rsp").address + (8 * regNo))))
      }
    }

    instructions += MovRegister(Register("rsp"), Register("rbp"))

    instructions.concat(
      stmts.map {
        case Skip() =>
        case Declaration(typ, x, y) => translateDeclaration(typ, x, y)
      }
    )

    instructions += MovImm(Immediate(0), Register("rax"))

    if (regsToSave == 0) {
      instructions.addOne(Pop(Register("rbx")))
    } else {
      for (regNo <-regsToSave to 0) {
        instructions.addOne(MovRegister(calleeRegistersToSave(regNo), Memory(Register("Rsp").address() - (8 * regNo))))
      }
    }

    // Finalise code
    instructions += Pop(Register("rbp"))
    instructions += Ret()

    currBlocks.concat(List(AsmBlock(Directive("text"), Label(blockName), instructions.toList)))
  }

  private def translateDeclaration(typ: Type, ident: Ident, RValue: RValue): List[Instruction] = ???
}
