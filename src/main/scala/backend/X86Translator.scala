package backend
import backend.Size._
import backend.IR._
import backend.IRRegisters._
import backend.x86IR.InstrSize._
import backend.x86IR._
import backend.x86Registers._

import scala.collection.mutable.ListBuffer

class X86Translator(val asmInstr: List[AsmBlock]) {
  private val byteSize = 8
  private val totalRegsUsed = 8
  private val stackAlignmentMask: Int = -16
  private val paramRegList: List[x86Registers] = List(x86DestinationReg(), x86SourceReg(), x86CounterReg(), x86Reg8(), x86Reg9())
  private val scratchRegList: List[x86Registers] = List(x86BaseReg(), x86Reg10(), x86Reg11())
  private val varRegList: List[x86Registers] = List(x86Reg12(), x86Reg13(), x86Reg14(), x86Reg15())
  private val ptrRegList: List[x86Registers] = List(x86BasePointer(), x86StackPointer())

  def translate(): List[x86Block] = {
    asmInstr.map(blockToX86IR)
  }

  def blockToX86IR(block: AsmBlock): x86Block = {
    new x86Block(block.roData.map(new x86ReadOnlyData(_)), block.directive.map(new x86Directive(_)),
      new x86Label(block.label)
      , instrsToX86IR(block.instructions))
  }

  def getOperand(src: Operand): x86Operand = {
    src match {
      case Immediate(x) => x86Immediate(x)
      case reg: Register => getRegister(reg) match {
        case Left(mem) => mem
        case Right(reg) => reg
      }
      case mem: Memory => getMemory(mem)
    }
  }

  // TODO: Fix register sizes (Thought: Overload getRegister to return DestinationReg?)
  def instrsToX86IR(instrs: List[Instruction]): List[x86Instruction] = {
    var x86instrs: List[x86Instruction] = List.empty
    for (instr <- instrs) {
      val new_instrs:ListBuffer[x86Instruction] = instr match {
        case IR.Push(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(x86IR.Push(register.get(getSize(size)), getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), x86IR.Push(x86DestinationReg().get(getSize(size)), fullReg))
          }

        }
        case IR.Pop(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(x86IR.Pop(register.get(getSize(size)), getSize(size)))
            case Right(mem) => ListBuffer(x86IR.Pop(x86DestinationReg().get(getSize(size)), fullReg), Mov(x86DestinationReg(), mem, fullReg))
          }
        }
        case IR.MovInstr(src, dst, size) => translateMov(src, dst, size)
        case IR.AddInstr(src, dst, size) => translateAdd(src, dst, size)
        case IR.SubInstr(src, dst, size) => translateSub(src, dst, size)
        case IR.MulInstr(src, dst, size) => translateMul(src, dst, size)
        case IR.DivInstr(src, dst, size) => ListBuffer(x86IR.Cmp(x86Immediate(0), getOperand(src), getSize(size)),
          x86IR.CDQ(), x86IR.IDiv(getOperand(src), getOperand(dst), getSize(size)))
        case IR.ModInstr(src, dst, size) => ListBuffer(x86IR.Cmp(x86Immediate(0), getOperand(src), getSize(size)),
          x86IR.CDQ(), x86IR.IDiv(getOperand(src), getOperand(dst), getSize(size)), x86IR.Mov(x86DataReg(), x86ReturnRegister(), halfReg))
        case CallInstr(label) => ListBuffer(Call(new x86Label(label)))
        case LeaInstr(src, dst, size) => {
          getRegister(dst) match {
            case Left(reg) => ListBuffer(Lea(getMemory(src), reg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)), Lea(getMemory(src), x86DestinationReg(), getSize(size)))
          }
        }
        case IR.CmpInstr(src, value, size) => ListBuffer(x86IR.Cmp(getOperand(src), getOperand(value), getSize(size)))
        case TestInstr(src, value, size) => ListBuffer(x86IR.Test(getOperand(src), getOperand(value), getSize(size)))
        case CMovInstr(src, dst, size) => ListBuffer(x86IR.CMov(getOperand(src), getOperand(dst), getSize(size)))
        case CMovNeInstr(src, dst, size) => ListBuffer(x86IR.CMovNe(getOperand(src), getOperand(dst), getSize(size)))
        case JeInstr(label) => ListBuffer(x86IR.Je(new x86Label(label)))
        case JneInstr(label) => ListBuffer(x86IR.Jne(new x86Label(label)))
        case JumpInstr(label) => ListBuffer(x86IR.Jump(new x86Label(label)))
        case MoveGT(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Setg(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Setg(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case MoveGTE(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Setge(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Setge(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case MoveLT(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Setl(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Setl(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case MoveLTE(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Setle(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Setle(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case MoveEq(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Sete(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Sete(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case MoveNEq(reg, size) => {
          getRegister(reg) match {
            case Left(register) => ListBuffer(Setne(register, eigthReg), MoveSX(register, register, eigthReg, getSize(size)))
            case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), getSize(size)),
              Setne(x86DestinationReg(), eigthReg), MoveSX(x86DestinationReg(), x86DestinationReg(), eigthReg, getSize(size)))
          }
        }
        case Align(StackPointer(), size) => ListBuffer(And(x86StackPointer(), x86Immediate(-16), getSize(size)))
        case Ret() => ListBuffer(Return())
      }
      x86instrs = x86instrs.concat(new_instrs)
    }
    x86instrs
  }

  private def translateMov(src:Operand, dst:Operand, size:Size): ListBuffer[x86Instruction] = {
    (src, dst) match {
      case (n:Immediate, reg:Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(x86Immediate(n.value), register, getSize(size)))
        case Right(mem) => ListBuffer(Mov(x86Immediate(n.value), mem, getSize(size)))
      }
      case (n: Immediate, mem: Memory) => ListBuffer(Mov(x86Immediate(n.value), getMemory(mem), getSize(size)))
      case (reg1: Register, reg2:Register) => (getRegister(reg1), getRegister(reg2)) match {
        case (Left(register1), Left(register2)) => ListBuffer(Mov(register1, register2, getSize(size)))
        case (Left(register), Right(mem)) => ListBuffer(Mov(register, mem, getSize(size)))
        case (Right(mem), Left(register)) => ListBuffer(Mov(mem, register, getSize(size)))
        case (Right(mem1), Right(mem2)) => ListBuffer(Mov(mem1, x86DestinationReg().get(getSize(size)), getSize(size)), Mov(x86DestinationReg().get(getSize(size)), mem2, getSize(size)))
      }
      case (reg:Register, mem:Memory) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(register, getMemory(mem), getSize(size)))
        case Right(memory) => ListBuffer(Mov(memory, x86DestinationReg(), getSize(size)), Mov(x86DestinationReg(), getMemory(mem), getSize(size)))
      }
      case (mem: Memory, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), register, getSize(size)))
        case Right(memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mov(x86DestinationReg(), memory, getSize(size)))
      }
      case (mem1:Memory, mem2:Memory) => ListBuffer(Mov(getMemory(mem1), x86DestinationReg(), getSize(size)), Mov(x86DestinationReg(), getMemory(mem2), getSize(size)))
    }
  }

  private def translateAdd(src: Operand, dst: Operand, size: Size): ListBuffer[x86Instruction] = {
    (src, dst) match {
      case (n: Immediate, StackPointer()) => ListBuffer(Add(x86Immediate(n.value), x86StackPointer(), fullReg))
      case (n: Immediate, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Add(x86Immediate(n.value), register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Add(x86Immediate(n.value), x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
      }
      case (n: Immediate, mem: Memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Add(x86Immediate(n.value), x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), fullReg))
      case (reg1: Register, reg2: Register) => (getRegister(reg1), getRegister(reg2)) match {
        case (Left(register1), Left(register2)) => ListBuffer(Add(register1, register2, halfReg), Jo(), MoveSX(register2, register2, halfReg, fullReg))
        case (Left(register), Right(mem)) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Add(register, x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
        case (Right(mem), Left(register)) => ListBuffer(Add(mem, register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case (Right(mem1), Right(mem2)) => ListBuffer(Mov(mem1, x86DestinationReg(), getSize(size)), Mov(mem2, x86Reg10(), getSize(size)), Add(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), mem1, getSize(size)), Mov(x86Reg10().get(getSize(size)), mem2, getSize(size)))
      }
      case (reg: Register, mem: Memory) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Add(register, x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), getSize(size)))
        case Right(memory) => ListBuffer(Mov(memory, x86DestinationReg(), getSize(size)), Mov(getMemory(mem), x86Reg10(), getSize(size)), Add(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), memory, getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem), getSize(size)))
      }
      case (mem: Memory, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), fullReg), Add(x86DestinationReg(), register, getSize(size)), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mov(memory, x86Reg10(), getSize(size)), Add(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem), getSize(size)), Mov(x86Reg10().get(getSize(size)), memory, getSize(size)))
      }
      case (mem1: Memory, mem2: Memory) => ListBuffer(Mov(getMemory(mem1), x86DestinationReg(), getSize(size)), Mov(getMemory(mem2), x86Reg10(), getSize(size)), Add(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem1), getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem2), getSize(size)))
    }
  }

  private def translateSub(src: Operand, dst: Operand, size: Size): ListBuffer[x86Instruction] = {
    (src, dst) match {
      case (n: Immediate, StackPointer()) => ListBuffer(Sub(x86Immediate(n.value), x86StackPointer(), fullReg))
      case (n: Immediate, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Sub(x86Immediate(n.value), register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Sub(x86Immediate(n.value), x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
      }
      case (n: Immediate, mem: Memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Sub(x86Immediate(n.value), x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), fullReg))
      case (reg1: Register, reg2: Register) => (getRegister(reg1), getRegister(reg2)) match {
        case (Left(register1), Left(register2)) => ListBuffer(Sub(register1, register2, halfReg), Jo(), MoveSX(register2, register2, halfReg, fullReg))
        case (Left(register), Right(mem)) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Sub(register, x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
        case (Right(mem), Left(register)) => ListBuffer(Sub(mem, register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case (Right(mem1), Right(mem2)) => ListBuffer(Mov(mem1, x86DestinationReg(), getSize(size)), Mov(mem2, x86Reg10(), getSize(size)), Sub(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), mem1, getSize(size)), Mov(x86Reg10().get(getSize(size)), mem2, getSize(size)))
      }
      case (reg: Register, mem: Memory) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Sub(register, x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), getSize(size)))
        case Right(memory) => ListBuffer(Mov(memory, x86DestinationReg(), getSize(size)), Mov(getMemory(mem), x86Reg10(), getSize(size)), Sub(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), memory, getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem), getSize(size)))
      }
      case (mem: Memory, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), fullReg), Sub(x86DestinationReg(), register, getSize(size)), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mov(memory, x86Reg10(), getSize(size)), Sub(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem), getSize(size)), Mov(x86Reg10().get(getSize(size)), memory, getSize(size)))
      }
      case (mem1: Memory, mem2: Memory) => ListBuffer(Mov(getMemory(mem1), x86DestinationReg(), getSize(size)), Mov(getMemory(mem2), x86Reg10(), getSize(size)), Sub(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem1), getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem2), getSize(size)))
    }
  }

  private def translateMul(src: Operand, dst: Operand, size: Size): ListBuffer[x86Instruction] = {
    (src, dst) match {
      case (n: Immediate, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mul(x86Immediate(n.value), register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(mem) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Mul(x86Immediate(n.value), x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
      }
      case (n: Immediate, mem: Memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mul(x86Immediate(n.value), x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), fullReg))
      case (reg1: Register, reg2: Register) => (getRegister(reg1), getRegister(reg2)) match {
        case (Left(register1), Left(register2)) => ListBuffer(Mul(register1, register2, halfReg), Jo(), MoveSX(register2, register2, halfReg, fullReg))
        case (Left(register), Right(mem)) => ListBuffer(Mov(mem, x86DestinationReg(), fullReg), Mul(register, x86DestinationReg(), getSize(size)), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), mem, fullReg))
        case (Right(mem), Left(register)) => ListBuffer(Mul(mem, register, halfReg), Jo(), MoveSX(register, register, halfReg, fullReg))
        case (Right(mem1), Right(mem2)) => ListBuffer(Mov(mem1, x86DestinationReg(), getSize(size)), Mov(mem2, x86Reg10(), getSize(size)), Mul(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), mem1, getSize(size)), Mov(x86Reg10().get(getSize(size)), mem2, getSize(size)))
      }
      case (reg: Register, mem: Memory) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mul(register, x86DestinationReg(), halfReg), Jo(), MoveSX(x86DestinationReg(), x86DestinationReg(), halfReg, fullReg), Mov(x86DestinationReg(), getMemory(mem), getSize(size)))
        case Right(memory) => ListBuffer(Mov(memory, x86DestinationReg(), getSize(size)), Mov(getMemory(mem), x86Reg10(), getSize(size)), Mul(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), memory, getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem), getSize(size)))
      }
      case (mem: Memory, reg: Register) => getRegister(reg) match {
        case Left(register) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), fullReg), Mul(x86DestinationReg(), register, getSize(size)), Jo(), MoveSX(register, register, halfReg, fullReg))
        case Right(memory) => ListBuffer(Mov(getMemory(mem), x86DestinationReg(), getSize(size)), Mov(memory, x86Reg10(), getSize(size)), Mul(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem), getSize(size)), Mov(x86Reg10().get(getSize(size)), memory, getSize(size)))
      }
      case (mem1: Memory, mem2: Memory) => ListBuffer(Mov(getMemory(mem1), x86DestinationReg(), getSize(size)), Mov(getMemory(mem2), x86Reg10(), getSize(size)), Mul(x86DestinationReg().get(halfReg), x86Reg10().get(halfReg), getSize(size)), Jo(), MoveSX(x86Reg10(), x86Reg10(), halfReg, fullReg), Mov(x86DestinationReg().get(getSize(size)), getMemory(mem1), getSize(size)), Mov(x86Reg10().get(getSize(size)), getMemory(mem2), getSize(size)))
    }
  }

  private def getRegister(reg: Register): Either[x86Registers, x86Memory] = {
    reg match {
      case ReturnRegister() => Left(x86ReturnRegister())
      case InstrPtrRegister() => Left(x86InstrPtrRegister())
      case SourceRegister() => Left(x86SourceReg())
      case DestinationRegister() => Left(x86DestinationReg())
      case DataRegister() => Left(x86DataReg())
      case BaseRegister() => Left(x86BaseReg())
      case BasePointer() => Left(x86BasePointer())
      case StackPointer() => Left(x86StackPointer())
      case p: paramReg => {
        if (p.no < paramRegList.length) {
          Left(paramRegList(p.no))
        } else {
          Right(x86Memory(x86BaseReg(), -byteSize * totalRegsUsed))
        }
      }
      case s: IRRegisters.scratchReg => {
        if (s.no < scratchRegList.length) {
          Left(scratchRegList(s.no))
        } else {
          Right(x86Memory(x86BaseReg(), -byteSize * totalRegsUsed))
        }
      }
      case v: IRRegisters.varReg => {
        if (v.no - 1 < varRegList.length) {
          Left(varRegList(v.no - 1))
        } else {
          Right(x86Memory(x86BaseReg(), -byteSize * totalRegsUsed))
        }
      }
    }
  }

  private def getMemory(mem: Memory): x86Memory = {
    var primReg: Option[x86Registers] = None
    if (mem.primReg.isDefined) {
      getRegister(mem.primReg.get) match {
        case Left(reg) => primReg = Some(reg)
      }
    }
    var secReg: Option[x86Registers] = None
    if (mem.secReg.isDefined) {
      getRegister(mem.secReg.get) match {
        case Left(reg) => secReg = Some(reg)
      }
    }
    val multiplier = mem.multiplier
    val offset:Option[x86Offset] = mem.offset.map {
      case OffsetInt(value) => x86OffsetInt(value)
      case OffsetLabel(label) => x86OffsetLabel(new x86Label(label))
    }

    x86Memory(primReg, secReg, multiplier, offset)
  }

  private def getSize(size: Size): InstrSize = {
    size match {
      case BIT_64 => fullReg
      case BIT_32 => halfReg
      case BIT_16 => quarterReg
      case BIT_8 => eigthReg
    }
  }

}