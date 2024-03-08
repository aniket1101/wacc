package backend

import backend.IR.{Directive, Label, ReadOnlyData}
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

  class x86Label(label: Label) extends Label(label) {
    def this(string: String) = this(Label(string))
  }

  class x86Directive(directive: Directive) extends Directive(directive)

  sealed trait x86Operand

  case class x86Immediate(value: Int) extends x86Operand

  class x86Register(val reg: String) extends x86Operand {
    def address(): Int = 0

    override def toString: String = reg
  }

  abstract class x86Registers(val reg64Bit: x86Register, val reg32Bit: x86Register,
                     val reg16Bit: x86Register, val reg8Bit: x86Register) extends x86Operand {

    def this(reg: x86Register) = this(reg, reg, reg, reg)
    def get(instrSize: InstrSize): x86Register = {
      instrSize match {
        case InstrSize.fullReg => reg64Bit
        case InstrSize.halfReg => reg32Bit
        case InstrSize.quarterReg => reg16Bit
        case InstrSize.eigthReg => reg8Bit
      }
    }
  }

  sealed trait x86Offset

  case class x86OffsetInt(value: Int) extends x86Offset

  case class x86OffsetLabel(label: x86Label) extends x86Offset

  case class x86Memory(primReg: Option[x86Registers], secReg: Option[x86Registers], multiplier: Option[Int], offset: Option[x86Offset]) extends x86Operand {
    def this(primReg: x86Registers, offset: Int) = this(Some(primReg), None, None, if (offset != 0) Some(x86OffsetInt(offset)) else None)

    def this(primReg: x86Registers, secReg: x86Registers) = this(Some(primReg), Some(secReg), None, None)

    def this(primReg: x86Registers, secReg: x86Registers, multiplier: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None)
    }

    def this(secReg: x86Registers, multiplier: Int, offset: Int) = {
      this(None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(x86OffsetInt(offset)) else None)
    }

    def this(primReg: x86Registers, secReg: x86Registers, multiplier: Int, offset: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(x86OffsetInt(offset)) else None)
    }
  }

  object x86Memory {
    def apply(primReg: x86Registers): x86Memory = new x86Memory(Some(primReg), None, None, None) {}

    def apply(primReg: x86Registers, offset: Int): x86Memory = new x86Memory(Some(primReg), None, None, Some(x86OffsetInt(offset))) {}

    def apply(primReg: x86Registers, label: x86Label): x86Memory = new x86Memory(Some(primReg), None, None, Some(x86OffsetLabel(label))) {}

    def apply(primReg: Option[x86Registers], secReg: Option[x86Registers], multiplier: Option[Int], offset: Option[x86Offset]):x86Memory = new x86Memory(primReg, secReg, multiplier, offset) {}
  }

  // ADD instruction
  sealed abstract case class Add(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Add {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}
    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Add = new Add(src, dst, instrSize) {}
  }

  // Sub instruction
  sealed abstract case class Sub(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Sub {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}
    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Sub = new Sub(src, dst, instrSize) {}
  }

  // Mul instruction
  sealed abstract case class Mul(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Mul {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}
    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Mul = new Mul(src, dst, instrSize) {}
  }

  sealed abstract case class IDiv(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object IDiv {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): IDiv = new IDiv(src, dst, instrSize) {}
  }

  // XOR instruction
  sealed abstract case class XOR(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object XOR {
    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Immediate, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): XOR = new XOR(src, dst, instrSize) {}
  }

  // MOV instruction
  sealed abstract case class Mov(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Mov {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Mov = new Mov(src, dst, instrSize) {}
  }

  // CMOV instruction
  sealed abstract case class CMov(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object CMov {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): CMov = new CMov(src, dst, instrSize) {}
  }

  sealed abstract case class CMovNe(src: x86Operand, dst: x86Operand, instrSize: InstrSize) extends x86Instruction

  object CMovNe {
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Memory, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): CMovNe = new CMovNe(src, dst, instrSize) {}
  }

  case class Call(label: x86Label) extends x86Instruction

  sealed abstract case class Cmp(src: x86Operand, value: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Cmp {
    def apply(src: x86Immediate, dst: x86Operand, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}
    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}
    def apply(src: x86Immediate, dst: x86Immediate, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Memory, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Cmp = new Cmp(src, dst, instrSize) {}
  }

  sealed abstract case class Test(src: x86Operand, value: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Test {
    def apply(src: x86Immediate, dst: x86Operand, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Operand, dst: x86Operand, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Immediate, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Memory, dst: x86Memory, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Registers, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Registers, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Registers, dst: x86Immediate, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}

    def apply(src: x86Immediate, dst: x86Memory, instrSize: InstrSize): Test = new Test(src, dst, instrSize) {}
  }

  sealed abstract case class Lea(src: x86Operand, value: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Lea {
    def apply(src: x86Memory, dst: x86Registers, instrSize: InstrSize): Lea = new Lea(src, dst, instrSize) {}
  }

  case class Je(label: x86Label) extends x86Instruction

  case class Jge(label: x86Label) extends x86Instruction

  case class Jl(label: x86Label) extends x86Instruction

  case class Jle(label: x86Label) extends x86Instruction

  case class Jne(label: x86Label) extends x86Instruction

  case class Jo() extends x86Instruction

  case class Jump(label: x86Label) extends x86Instruction

  case class Push(reg: x86Register, instrSize: InstrSize) extends x86Instruction

  case class Pop(reg: x86Register, instrSize: InstrSize) extends x86Instruction

  sealed abstract case class And(src: x86Operand, value: x86Operand, instrSize: InstrSize) extends x86Instruction

  object And {
    def apply(reg:x86Registers, value:x86Immediate, instrSize: InstrSize): And = new And(reg, value, instrSize) {}

    def apply(reg1:x86Registers, reg2:x86Registers, instrSize: InstrSize): And = new And(reg1, reg2, instrSize) {}
  }

  sealed abstract case class Or(src: x86Operand, value: x86Operand, instrSize: InstrSize) extends x86Instruction

  object Or {
    def apply(reg: x86Registers, value: x86Immediate, instrSize: InstrSize): Or = new Or(reg, value, instrSize) {}

    def apply(reg1: x86Registers, reg2: x86Registers, instrSize: InstrSize): Or = new Or(reg1, reg2, instrSize) {}
  }

  case class Sete(reg:x86Registers, instrSize: InstrSize) extends x86Instruction
  case class Setne(reg:x86Registers, instrSize: InstrSize) extends x86Instruction
  case class Setg(reg:x86Registers, instrSize: InstrSize) extends x86Instruction
  case class Setge(reg:x86Registers, instrSize: InstrSize) extends x86Instruction
  case class Setl(reg:x86Registers, instrSize: InstrSize) extends x86Instruction
  case class Setle(reg:x86Registers, instrSize: InstrSize) extends x86Instruction

  // MOVSX instruction
  sealed abstract case class MoveSX(src:x86Operand, dst:x86Operand, srcSize: InstrSize, dstSize: InstrSize) extends x86Instruction

  object MoveSX {
    def apply(src:x86Registers, dst:x86Registers, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}

    def apply(src:x86Registers, dst:x86Memory, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}

    def apply(src:x86Registers, dst:x86Immediate, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}

    def apply(src:x86Memory, dst:x86Registers, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}

    def apply(src:x86Immediate, dst:x86Registers, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}

    def apply(src:x86Immediate, dst:x86Memory, srcSize: InstrSize, dstSize: InstrSize): MoveSX = new MoveSX(src, dst, srcSize, dstSize) {}
  }

  case class CDQ() extends x86Instruction
  case class Return() extends x86Instruction

  sealed trait Block

  class x86ReadOnlyData(readOnlyData: ReadOnlyData) extends ReadOnlyData(readOnlyData)

  class x86Block(val roData: Option[x86ReadOnlyData], val directive: Option[x86Directive], val label: x86Label, var instructions: List[x86Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }
}
