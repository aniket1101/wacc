package backend
import backend.IR.Size._
import backend.IR._
import backend.IRRegisters._
import backend.x86IR.InstrSize._
import backend.x86IR._
import backend.x86Registers._

class X86Translator(val asmInstr: List[AsmBlock]) {
  private val stackAlignmentMask: Int = -16
  private val paramRegs: List[x86Registers] = List(DestinationReg(), SourceReg(), CounterReg(), Reg8(), Reg9())

  def translate(): List[x86Block] = {
      asmInstr.map(blockToX86IR)
  }

  def blockToX86IR(block: AsmBlock): x86Block = {
        new x86Block(block.roData, block.directive, block.label, block.instructions.map(instrToX86IR))
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
      case IR.Ret() => x86IR.Return()
    }
  }

  private def getRegister(reg: Register): x86Registers = {
    reg match {
      case _ => AccumulatorReg()
    }
  }

  private def getMemory(memory: Memory): x86Memory = ???

  private def getSize(size: Size): InstrSize = {
      size match {
        case BIT_64 => fullReg
        case BIT_32 => halfReg
        case BIT_16 => quarterReg
        case BIT_8 => eigthReg
      }
    }

}