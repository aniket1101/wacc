package backend

import backend.IR.MovRegister

object IR {

  sealed trait Instruction

  case class Label(name: String)
  case class Directive(name: String)

  sealed trait Operand extends Instruction

  sealed trait MemOrReg extends Operand
  sealed trait RegOrImm extends Operand

  case class Immediate(value: Int) extends RegOrImm
  case class Register(reg: String) extends MemOrReg with RegOrImm {
    def address():Int = 0
  }
  case class Memory(address: Int) extends MemOrReg

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
  case class MovMemory(val src: Memory, val dst: RegOrImm) extends Instruction
  case class MovImm(val src: Immediate, val dst: RegOrImm) extends Instruction

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
  class AsmBlock(directive: Directive, label: Label, instructions: List[Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }

  case class Exit() extends AsmBlock(Directive("text"), Label("exit"), List(
    Push(Register("rbp")),
    MovRegister(Register("rsp"), Register("rbp")),
    Align(Register("rsp")),
    Call(Label("exit@plt")),
    MovRegister(Register("rbp"), Register("rsp")),
    Pop(Register("rbp")),
    Ret()
  ))

}
