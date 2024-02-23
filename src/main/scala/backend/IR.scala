package backend
import IRRegisters._

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

  sealed abstract case class Memory(primReg: Option[Register], secReg: Option[Register], multiplier: Option[Int], offset: Option[Int]) extends MemOrReg {
    def this(primReg: Register, offset: Int) = this(Some(primReg), None, None, if (offset != 0) Some(offset) else None)

    def this(primReg: Register, secReg: Register) = this(Some(primReg), Some(secReg), None, None)

    def this(primReg: Register, secReg: Register, multiplier: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None)
    }

    def this(secReg: Register, multiplier: Int, offset: Int) = {
      this (None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(offset) else None)
    }

    def this(primReg: Register, secReg: Register, multiplier: Int, offset: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(offset) else None)
    }
  }
  object Memory {
    def apply(primReg: Register): Memory = new Memory(Some(primReg), None, None, None) {}
    def apply(primReg: Register, offset: Int):Memory = new Memory(Some(primReg), None, None, Some(offset)) {}
  }

  // ADD instruction
  sealed abstract case class AddInstr(src: Operand, dst: Operand) extends Instruction
  object AddInstr {
    def apply(src:Register, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Register, dst:Memory):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Register, dst:Immediate):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Memory, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Memory, dst:Immediate):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Immediate, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Immediate, dst:Memory):AddInstr = new AddInstr(src, dst) {}
  }

  sealed abstract case class SubInstr(src: Operand, dst: Operand) extends Instruction
  object SubInstr {
    def apply(src: Register, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Register, dst: Memory): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Memory, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): SubInstr = new SubInstr(src, dst) {}
  }

  sealed abstract case class MulInstr(src: Operand, dst: Operand) extends Instruction
  object MulInstr {
    def apply(src: Register, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Register, dst: Memory): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Memory, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): MulInstr = new MulInstr(src, dst) {}
  }

  // XOR instruction
  sealed abstract case class XORInstr(src: Operand, dst: Operand) extends Instruction
  object XORInstr {
    def apply(src: Register, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Register, dst: Memory): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Memory, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): XORInstr = new XORInstr(src, dst) {}
  }

  // MOV instruction
  sealed abstract case class MovInstr(src: Operand, dst: Operand) extends Instruction
  object MovInstr {
    def apply(src: Register, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Register, dst: Memory): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Memory, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): MovInstr = new MovInstr(src, dst) {}
  }

  case class CallInstr(label:Label) extends Instruction

  sealed abstract case class CmpInstr(src: Operand, value: Operand) extends Instruction
  object CmpInstr {
    def apply(src: Immediate, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Memory, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Register, dst: Register): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}
  }

  sealed abstract case class CmpInstr(src: Operand, value: Operand) extends Instruction
  object LeaInstr {
    def apply(src: Register, dst: Memory): LeaInstr = new LeaInstr(src, dst) {}
  }

  case class JeInstr(label: Label) extends Instruction
  case class JgeInstr(label: Label) extends Instruction
  case class JlInstr(label: Label) extends Instruction
  case class JleInstr(label: Label) extends Instruction
  case class JumpInstr(label: Label) extends Instruction

  case class Push(reg: Register) extends Instruction
  case class Pop(reg: Register) extends Instruction

  case class Align(reg: Register) extends Instruction
  case class Ret() extends Instruction

  sealed trait Block
  class AsmBlock(val directive: Directive, val label: Label, var instructions: List[Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }

  case class ExitBlock() extends AsmBlock(Directive(""), Label("_exit"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CallInstr(Label("exit@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class PrintBlock() extends AsmBlock(Directive(""), Label("_prints"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(new scratchReg("rdx"), new paramReg("paramReg1"))
    // MovInstr(new scratchReg("esi"), ??? dword ptr [rdi - 4] ???)
    // LeaInstr(ReturnRegister(), Memory())
    // mov al, 0
    CallInstr(Label("printf@plt")),
    MovInstr(new scratchReg("rdi"), Immediate(0))
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

}
