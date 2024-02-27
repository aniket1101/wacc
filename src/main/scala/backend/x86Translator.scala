package backend

import backend.IR.Size.{BIT_16, BIT_32, BIT_64, BIT_8, Size}
import backend.x86IR._
import backend.IR._
import backend.x86IR.InstrSize._
import backend.x86Registers._

object x86Translator {
  def translateIR(blocks: List[AsmBlock]): List[x86Block] = {
    var x86Blocks:List[x86Block] = List.empty
    for (block <- blocks) {
      x86Blocks = x86Blocks.concat(translateBlock(block))
    }
    x86Blocks
  }

  def translateBlock(block: IR.AsmBlock): List[x86Block] = {
    val instructions = block.instructions
    for (instr <- instructions) {
      instr match {
        case AddInstr(src, dst, size) => translateAdd(src, dst, size)
        case SubInstr(src, dst, size) => translateSub(src, dst, size)
        case MulInstr(src, dst, size) => translateMul(src, dst, size)
        case ModInstr(src, dst, size) => translateMod(src, dst, size)
        case MovInstr(src, dst, size) => // Mov(new x86Register(src.reg), new x86Register(dst.reg), InstrSize.fullReg)
        case CallInstr(label) => Call(x86Label(label.name))
        case LeaInstr(src:Register, value:Memory, size) => Lea(getMemory(value), getRegister(src), getSize(size))
        case JeInstr(label) => Je(x86Label(label.name))
        case JneInstr(label) => Jne(x86Label(label.name))
        case MoveGT(reg, size) => List(Setg(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case MoveGTE(reg, size) => List(Setge(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case MoveLT(reg, size) => List(Setl(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case MoveLTE(reg, size) => List(Setle(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case MoveEq(reg, size) => List(Sete(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case MoveNEq(reg, size) => List(Setne(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
        case IR.Push(reg, size) => x86IR.Push(getRegister(reg), getSize(size))
        case IR.Pop(reg, size) => x86IR.Pop(getRegister(reg), getSize(size))
        case Align(reg, size) => List(And(getRegister(reg), x86Immediate(-16), getSize(size)))
        case Ret() => Return()
      }
    }
    List.empty
  }

  // TODO: Change size to size - 1 and fix Immediates
  def translateAdd(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
    (src, dst) match {
      case (src: Register, dst: Register) =>
        List(Add(getRegister(src), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))

      case (src: Register, dst: Memory) => {
        List(Mov(getMemory(dst), R9(), fullReg), Add(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
      }

      case (src: Register, dst: Immediate) => {
        List.empty
      }

      case (src: Memory, dst: Register) => {
        List(Mov(getMemory(src), R9(), fullReg), Add(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
      }

      case (src: Memory, dst: Immediate) => {
        List.empty
      }

      case (src: Immediate, dst: Register) => {
        List.empty
      }

      case (src: Immediate, dst: Memory) => {
        List.empty
      }
    }
  }

  // TODO: Change size to size - 1 and fix Immediates
  def translateSub(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
    (src, dst) match {
      case (src: Register, dst: Register) =>
        List(Sub(getRegister(src), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))

      case (src: Register, dst: Memory) => {
        List(Mov(getMemory(dst), R9(), fullReg), Sub(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
      }

      case (src: Register, dst: Immediate) => {
        List.empty
      }

      case (src: Memory, dst: Register) => {
        List(Mov(getMemory(src), R9(), fullReg), Sub(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
      }

      case (src: Memory, dst: Immediate) => {
        List.empty
      }

      case (src: Immediate, dst: Register) => {
        List.empty
      }

      case (src: Immediate, dst: Memory) => {
        List.empty
      }
    }
  }

  // TODO: Change size to size - 1 and fix Immediates
  def translateMul(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
    (src, dst) match {
      case (src: Register, dst: Register) =>
        List(Mul(getRegister(src), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))

      case (src: Register, dst: Memory) => {
        List(Mov(getMemory(dst), R9(), fullReg), Mul(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
      }

      case (src: Register, dst: Immediate) => {
        List.empty
      }

      case (src: Memory, dst: Register) => {
        List(Mov(getMemory(src), R9(), fullReg), Mul(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
      }

      case (src: Memory, dst: Immediate) => {
        List.empty
      }

      case (src: Immediate, dst: Register) => {
        List.empty
      }

      case (src: Immediate, dst: Memory) => {
        List.empty
      }
    }
  }

  // TODO: Change size to size - 1 and fix Immediates
  def translateMod(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
//    (src, dst) match {
//      case (src: Register, dst: Register) =>
//        List(Cmp(getRegister(dst), x86Immediate(0), halfReg), Je(x86Label("_errDivZero")), CDQ(), )
//
//      case (src: Register, dst: Memory) => {
//        List(Mov(getMemory(dst), R9(), fullReg), Mul(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
//      }
//
//      case (src: Register, dst: Immediate) => {
//        List.empty
//      }
//
//      case (src: Memory, dst: Register) => {
//        List(Mov(getMemory(src), R9(), fullReg), Mul(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
//      }
//
//      case (src: Memory, dst: Immediate) => {
//        List.empty
//      }
//
//      case (src: Immediate, dst: Register) => {
//        List.empty
//      }
//
//      case (src: Immediate, dst: Memory) => {
//        List.empty
//      }
//    }
    List.empty
  }

  // TODO: Change size to size - 1 and fix Immediates
  def translateMov(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
    (src, dst) match {
      case (src: Register, dst: Register) =>
        List(Mul(getRegister(src), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))

      case (src: Register, dst: Memory) => {
        List(Mov(getMemory(dst), R9(), fullReg), Mul(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
      }

      case (src: Register, dst: Immediate) => {
        List.empty
      }

      case (src: Memory, dst: Register) => {
        List(Mov(getMemory(src), R9(), fullReg), Mul(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
      }

      case (src: Memory, dst: Immediate) => {
        List.empty
      }

      case (src: Immediate, dst: Register) => {
        List.empty
      }

      case (src: Immediate, dst: Memory) => {
        List.empty
      }
    }
  }

  def getRegister(reg:Register): x86Register = {
    new x86Register(reg.reg)
  }

  def getSize(size:Size): InstrSize = {
    size match {
      case BIT_64 => fullReg
      case BIT_32 => halfReg
      case BIT_16 => quarterReg
      case BIT_8 => eigthReg
    }
  }

  def getMemory(mem: Memory): x86Memory = {
    ???
//    val primReg = mem.primReg.map(reg => new x86Register(reg.reg))
//    val secReg = mem.secReg.map(reg => new x86Register(reg.reg))
//    val multiplier = mem.multiplier
//    val offset = mem.offset.map {
//      case OffsetInt(value) => x86OffsetInt(value)
//      case OffsetLabel(label) => x86OffsetLabel(new x86Label(label.name))
//    }
//
//    x86Memory(primReg, secReg, multiplier, offset)
  }

}