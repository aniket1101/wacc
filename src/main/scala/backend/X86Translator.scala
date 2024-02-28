package backend
import backend.Size._
import backend.IR._
import backend.IRRegisters
import backend.IRRegisters._
import backend.x86IR.InstrSize._
import backend.x86IR._
import backend.x86Registers._

class X86Translator(val asmInstr: List[AsmBlock]) {
  private val STACK_ALIGNMENT_MASK: Int = -16
  private val paramRegList: List[x86Registers] = List(x86DestinationReg(), x86SourceReg(), x86CounterReg(), x86Reg8(), x86Reg9())
  private val scratchRegList: List[x86Registers] = List(x86BaseReg(), x86Reg10(), x86Reg11())
  private val varRegList: List[x86Registers] = List(x86Reg12(), x86Reg13(), x86Reg14(), x86Reg15())
  private val ptrRegList: List[x86Registers] = List(x86BasePointer(), x86StackPointer())

  def translate(): List[x86Block] = {
      asmInstr.map(blockToX86IR)
  }

  def blockToX86IR(block: AsmBlock): x86Block = {
        new x86Block(block.roData.map(new x86ReadOnlyData(_)), block.directive.map(new x86Directive(_)),
          new x86Label(block.label), block.instructions.map(instrToX86IR))
  }

  def getOperand(src: Operand): x86Operand = {
    src match {
      case Immediate(x) => x86Immediate(x)
      case reg: Register => getRegister(reg)
      case mem: Memory => getMemory(mem)
    }
  }

  def instrToX86IR(instr: Instruction): x86Instruction = {
    instr match {
      case IR.Push(reg, size) => x86IR.Push(getRegister(reg).get(getSize(size)), getSize(size))
      case IR.Pop(reg, size) => x86IR.Pop(getRegister(reg).get(getSize(size)), getSize(size))
      case IR.MovInstr(src, dst, size) => x86IR.Mov(getOperand(src), getOperand(dst), getSize(size))
      case IR.AddInstr(src, dst, size) => x86IR.Add(getOperand(src), getOperand(dst), getSize(size))
      case IR.SubInstr(src, dst, size) => x86IR.Sub(getOperand(src), getOperand(dst), getSize(size))
      case IR.MulInstr(src, dst, size) => x86IR.Mul(getOperand(src), getOperand(dst), getSize(size))
      case IR.CallInstr(label) => x86IR.Call(new x86Label(label))
      case IR.Align(reg, size) => x86IR.And(getRegister(reg), x86Immediate(STACK_ALIGNMENT_MASK), getSize(size))
      case IR.CmpInstr(src, value, size) => x86IR.Cmp(getOperand(src), getOperand(value), getSize(size))
      case IR.LeaInstr(mem, reg, size) => x86IR.Lea(getMemory(mem), getRegister(reg), getSize(size))
      case IR.JeInstr(label) => x86IR.Je(new x86Label(label))
      case IR.JneInstr(label) => x86IR.Jne(new x86Label(label))
      case IR.JumpInstr(label) => x86IR.Jump(new x86Label(label))
      case IR.Ret() => x86IR.Return()
    }
  }

  private def getRegister(reg: Register): x86Registers = {
    reg match {
      case ReturnRegister() => x86ReturnRegister()
      case InstrPtrRegister() => x86InstrPtrRegister()
      case SourceRegister() => x86SourceReg()
      case DestinationRegister() => x86DestinationReg()
      case DataRegister() => x86DataReg()
      case BaseRegister() => x86BaseReg()
      case BasePointer() => x86BasePointer()
      case StackPointer() => x86StackPointer()
      case p: paramReg => paramRegList(p.no)
      case s: IRRegisters.scratchReg => varRegList(Math.min(s.no, scratchRegList.length-1)) // TODO: Properly implement register allocation
      case v: IRRegisters.varReg => varRegList(Math.min(v.no - 1, varRegList.length-1)) // TODO: Properly implement register allocation
    }
  }

  private def getMemory(mem: Memory): x86Memory = {
    val primReg = mem.primReg.map(getRegister)
    val secReg =  mem.secReg.map(getRegister)
    val multiplier = mem.multiplier
    val offset = mem.offset.map {
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