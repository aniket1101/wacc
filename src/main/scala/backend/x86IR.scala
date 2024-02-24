package backend

import backend.x86IR.InstrSize.InstrSize

object x86IR {
  object InstrSize extends Enumeration {
    type InstrSize = Value

    val fullReg = Value(64)
    val halfReg = Value(32)
    val quarterReg = Value(16)
    val eigthReg = Value(8)
  }

  sealed trait x86Instruction

  case class x86Label(name: String)

  case class x86Directive(name: String)

  sealed trait x86Operand

  case class x86Immediate(value: Int) extends x86Operand

  class x86Register(val reg: String) extends x86Operand {
    def address(): Int = 0

    override def toString: String = reg
  }

  sealed trait x86Offset

  case class x86OffsetInt(value: Int) extends x86Offset

  case class x86OffsetLabel(label: x86Label) extends x86Offset

  sealed abstract case class x86Memory(primReg: Option[x86Register], secReg: Option[x86Register], multiplier: Option[Int], offset: Option[x86Offset]) extends x86Operand {
    def this(primReg: x86Register, offset: Int) = this(Some(primReg), None, None, if (offset != 0) Some(x86OffsetInt(offset)) else None)

    def this(primReg: x86Register, secReg: x86Register) = this(Some(primReg), Some(secReg), None, None)

    def this(primReg: x86Register, secReg: x86Register, multiplier: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None)
    }

    def this(secReg: x86Register, multiplier: Int, offset: Int) = {
      this(None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(x86OffsetInt(offset)) else None)
    }

    def this(primReg: x86Register, secReg: x86Register, multiplier: Int, offset: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(x86OffsetInt(offset)) else None)
    }
  }

  object x86Memory {
    def apply(primReg: x86Register): x86Memory = new x86Memory(Some(primReg), None, None, None) {}

    def apply(primReg: x86Register, offset: Int): x86Memory = new x86Memory(Some(primReg), None, None, Some(x86OffsetInt(offset))) {}

    def apply(primReg: x86Register, label: x86Label): x86Memory = new x86Memory(Some(primReg), None, None, Some(x86OffsetLabel(label))) {}
  }

  // ADD instruction
  sealed abstract case class Add(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Add {
    def apply(src: x86Register, dst: x86Register, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Memory, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Immediate, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Register, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Register, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}
  }

  // Sub instruction
  sealed abstract case class Sub(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Sub {
    def apply(src: x86Register, dst: x86Register, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Memory, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Immediate, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Register, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Register, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}
  }

  // Mul instruction
  sealed abstract case class Mul(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Mul {
    def apply(src: x86Register, dst: x86Register, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Memory, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Immediate, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Register, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Register, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}
  }

  // XOR instruction
  sealed abstract case class XOR(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object XOR {
    def apply(src: x86Register, dst: x86Register, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Memory, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Register, dst: x86Immediate, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Register, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Register, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}
  }

  // MOV instruction
  sealed abstract case class Mov(src: x86Operand, dst: x86Operand) extends x86Instruction

  object Mov {
    def apply(src: x86Register, dst: x86Register): Mov = new Mov(src, dst) {}

    def apply(src: x86Register, dst: x86Memory): Mov = new Mov(src, dst) {}

    def apply(src: x86Register, dst: x86Immediate): Mov = new Mov(src, dst) {}

    def apply(src: x86Memory, dst: x86Register): Mov = new Mov(src, dst) {}

    def apply(src: x86Immediate, dst: x86Register): Mov = new Mov(src, dst) {}

    def apply(src: x86Immediate, dst: x86Memory): Mov = new Mov(src, dst) {}
  }

  case class Call(label: x86Label) extends x86Instruction

  sealed abstract case class Cmp(src: x86Operand, value: x86Operand) extends x86Instruction

  object Cmp {
    def apply(src: x86Immediate, dst: x86Immediate): Cmp = new Cmp(src, dst) {}

    def apply(src: x86Memory, dst: x86Memory): Cmp = new Cmp(src, dst) {}

    def apply(src: x86Register, dst: x86Register): Cmp = new Cmp(src, dst) {}

    def apply(src: x86Immediate, dst: x86Register): Cmp = new Cmp(src, dst) {}

    def apply(src: x86Register, dst: x86Immediate): Cmp = new Cmp(src, dst) {}

    def apply(src: x86Immediate, dst: x86Memory): Cmp = new Cmp(src, dst) {}
  }

  sealed abstract case class LeaInstr(src: x86Operand, value: x86Operand) extends x86Instruction

  object LeaInstr {
    def apply(src: x86Memory, dst: x86Register): LeaInstr = new LeaInstr(src, dst) {}
  }

  case class Je(label: x86Label) extends x86Instruction

  case class Jge(label: x86Label) extends x86Instruction

  case class Jl(label: x86Label) extends x86Instruction

  case class Jle(label: x86Label) extends x86Instruction

  case class Jne(label: x86Label) extends x86Instruction

  case class Jump(label: x86Label) extends x86Instruction

  case class Push(reg: x86Register) extends x86Instruction

  case class Pop(reg: x86Register) extends x86Instruction

  case class Align(reg: x86Register) extends x86Instruction

  case class Ret() extends x86Instruction

  sealed trait Block

  class x86Block(val directive: x86Directive, val label: x86Label, var instructions: List[x86Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }

//  case class ExitBlock() extends AsmBlock(Directive(""), Label("_exit"), List(
//    Push(BasePointer()),
//    MovInstr(StackPointer(), BasePointer()),
//    Align(StackPointer()),
//    CallInstr(Label("exit@plt")),
//    MovInstr(BasePointer(), StackPointer()),
//    Pop(BasePointer()),
//    Ret()
//  ))
//
//  class ReadOnlyData(val strings: List[String]) extends Block {
//    override def toString: String = {
//      s".section .rodata\n" + strings.map(str => s".L.str${strings.indexOf(str)}:\n\t.asciz \"$str\"").mkString("\n") + "\n"
//    }
//  }
//
//  case class PrintBlock() extends AsmBlock(Directive(""), Label("_prints"), translatePrint(StringType()(-1, -1)).toList)
}
