package backend

import backend.IR.MovRegister
import backend.IRRegisters.{BasePointer, StackPointer}

object IR {

  sealed trait Instruction

  case class Label(name: String)
  case class Directive(name: String)

  sealed trait Operand

  sealed trait MemOrReg extends Operand
  sealed trait RegOrImm extends Operand

  case class Immediate(value: Int) extends RegOrImm
  class Register(val reg: String) extends MemOrReg with RegOrImm {
    def address():Int = 0

    override def toString: String = reg
  }

  class Memory(primReg: Option[Register], secReg: Option[Register], multiplier: Option[Int], offset: Option[Int]) extends MemOrReg {
    require(
      primReg.isDefined && !secReg.isDefined && !multiplier.isDefined && !offset.isDefined ||
      primReg.isDefined && !secReg.isDefined && !multiplier.isDefined && offset.isDefined ||
      primReg.isDefined && secReg.isDefined && !multiplier.isDefined && !offset.isDefined ||
      primReg.isDefined && secReg.isDefined && multiplier.isDefined && !offset.isDefined ||
      !primReg.isDefined && secReg.isDefined && multiplier.isDefined && offset.isDefined ||
      primReg.isDefined && secReg.isDefined && multiplier.isDefined && offset.isDefined,
      "Invalid combination of parameters"
    )
    // Define constructors with different combinations of parameters
    def this(primReg: Register) = this(Some(primReg), None, None, None)
    def this(primReg: Register, offset: Int) = this(Some(primReg), None, None, Some(offset))
    def this(primReg: Register, secReg: Register) = this(Some(primReg), Some(secReg), None, None)
    def this(primReg: Register, secReg: Register, multiplier: Int) = this(Some(primReg), Some(secReg), Some(multiplier), None)
    def this(secReg: Register, multiplier: Int, offset: Int) = this(None, Some(secReg), Some(multiplier), Some(offset))
    def this(primReg: Register, secReg: Register, multiplier: Int, offset: Int) = this(Some(primReg), Some(secReg), Some(multiplier), Some(offset))

    override def toString: String = {
      val primRegStr = primReg.map(_.toString).getOrElse("")
      val first_op = if (primReg != None && secReg != None) " + " else ""
      val secRegStr = secReg.map(_.toString).getOrElse("")
      val multiplierStr = multiplier.map("*" + _).getOrElse("")
      val offsetStr = if (offset != None) if (offset.get >= 0) s" + ${offset.get}" else s"${offset.get}" else ""
      s"[$primRegStr$first_op$secRegStr$multiplierStr$offsetStr]"
    }
  }
  // ADD instruction
  case class AddRegister(val src: Register, val dst: Operand) extends Instruction
  case class AddMemory(val src: Memory, val dst: RegOrImm) extends Instruction
  case class AddImm(val src: Immediate, val dst: RegOrImm) extends Instruction

  // SUB instruction
  case class SubRegister(val src: Register, val dst: Operand) extends Instruction
  case class SubMemory(val src: Memory, val dst: RegOrImm) extends Instruction
  case class SubImm(val src: Immediate, val dst: RegOrImm) extends Instruction

  // MUL instruction
  case class MulRegister(val src: Register, val dst: Operand) extends Instruction
  case class MulMemory(val src: Memory, val dst: RegOrImm) extends Instruction
  case class MulImm(val src: Immediate, val dst: RegOrImm) extends Instruction

  // XOR instruction
  case class XorRegister(val src: Register, val dst: Operand) extends Instruction
  case class XorMemory(val src: Memory, val dst: RegOrImm) extends Instruction
  case class XorImm(val src: Immediate, val dst: RegOrImm) extends Instruction

  // MOV instruction
  case class MovRegister(val src: Register, val dst: Operand) extends Instruction
  case class MovMemory(val src: Memory, val dst: Register) extends Instruction
  case class MovImm(val src: Immediate, val dst: MemOrReg) extends Instruction

  case class Call(label:Label) extends Instruction
  case class Cmp(src: Operand, value: Operand) extends Instruction
  case class Je(label: Label) extends Instruction
  case class Jge(label: Label) extends Instruction
  case class Jl(label: Label) extends Instruction
  case class Jle(label: Label) extends Instruction
  case class Jump(label: Label) extends Instruction

  case class Push(reg: Register) extends Instruction
  case class Pop(reg: Register) extends Instruction

  case class Align(reg: Register) extends Instruction
  case class Ret() extends Instruction

  sealed trait Block
  class AsmBlock(val directive: Directive, val label: Label, val instructions: List[Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }

  case class Exit() extends AsmBlock(Directive(""), Label("_exit"), List(
    Push(BasePointer()),
    MovRegister(StackPointer(), BasePointer()),
    Align(StackPointer()),
    Call(Label("exit@plt")),
    MovRegister(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

}
