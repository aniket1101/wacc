package backend
import backend.x86IR._
import backend.IR._
import backend.IRRegisters._
import backend.x86IR._
import backend.x86Registers.{CounterReg, DestinationReg}

class X86Translator(val asmInstr: List[AsmBlock]) {
  private val stackAlignmentMask: Int = -16
//  private val paramRegs: List[x86Registers] = List(new paramReg("RDI"), new paramReg("RSI"), new paramReg("RCX"), new paramReg("R8"), new paramReg("R9"))
  private val paramRegs: List[x86Registers] = List(DestinationReg(), SourceReg(), CounterReg(), Reg8(), Reg9())

  def toAsmCode(): List[x86Instruction] = {
    ".intel_syntax noprefix\n.globl main\n" +
      asmInstr.map({
        case block: AsmBlock =>
          block.roData.map(convertROData).getOrElse("") +
            block.directive.map(convertDir).getOrElse("") +
            convertLabel(block.label) + convertInstrs(block.instructions)
      }).mkString("").strip() + "\n"
  }

  def convertROData(rodata: ReadOnlyData): String = {
    val rod: StringBuilder = new StringBuilder(".section .rodata\n")
    for (i <- rodata.data.indices) {
      rodata.data(i) match {
        case (n: Int, str: String) =>
          val labelName = if (rodata.labelName.isEmpty) "" else s"_${rodata.labelName}_"
          rod.append(
            s""".section .rodata
               |  .int $n
               |.L.${labelName}str$i:
               |  .asciz \"$str\"\n""".stripMargin)
      }
    }
    rod.toString()
  }

  private def convertDir(dir: Directive): String = if (dir.name.isEmpty) "" else s".${dir.name}\n"

  private def convertLabel(label: Label): String = if (label.name.isEmpty) "" else s"${label.name}:\n"

  private def convertInstrs(instrs: List[Instruction]): String = {
    instrs match {
      case Nil => ""
      case instr :: Nil => s"\t${convertInstr(instr)}\n\n"
      case head :: tail => s"\t${convertInstr(head)}\n" + convertInstrs(tail)
    }
  }

  private def convertInstr(instr: Instruction): String = {
    instr match {
      case Push(reg) => formatInstr("push", reg)
      case Pop(reg) => formatInstr("pop", reg)
      case Ret() => formatInstr("ret")
      case MovInstr(src, dst) => formatInstr("mov", src, dst)
      case CallInstr(label) => formatInstr("call", label)
      case Align(reg) => formatInstr("and", reg, stackAlignmentMask)
      case AddInstr(reg1, reg2) => formatInstr("add", reg1, reg2)
      case SubInstr(value, reg) => formatInstr("sub", value, reg)
      case MulInstr(value, reg) => formatInstr("imul", value, reg)
      case DivInstr(srcReg, _) => "cdq\n\t" + formatInstr("idiv", srcReg)
      case JeInstr(label) => formatInstr("je", label)
      case JneInstr(label) => formatInstr("jne", label)
      case JumpInstr(label) => formatInstr("jmp", label)
      case CmpInstr(op1, op2) => formatInstr("cmp", op1, op2)
      case LeaInstr(reg, mem) => formatInstr("lea", reg, mem)
      case ModInstr(reg1, reg2) => "push rdx\n" +
        "mov rax" + formatOperand(reg1) + "\n" +
        "xor rdx, rdx\n" +
        "div " + formatOperand(reg2) + "\n" +
        "mov " + formatOperand(reg1) + ", rdx\n" +
        "pop rdx"
      case MoveEq(reg) => formatInstr("meq", reg)
      case MoveNEq(reg) => formatInstr("mneq", reg)
      case MoveLT(reg) => formatInstr("mlt", reg)
      case MoveLTE(reg) => formatInstr("mlte", reg)
      case MoveGT(reg) => formatInstr("mgt", reg)
      case MoveGTE(reg) => formatInstr("mgte", reg)
    }
  }

  private def formatInstr(opcode: String, operand1: Operand, operand2: Operand): String = {
    s"$opcode ${formatOperand(operand2)}, ${formatOperand(operand1)}"
  }

  private def formatInstr(opcode: String, operand: Operand): String = {
    s"$opcode ${formatOperand(operand)}"
  }

  private def formatInstr(opcode: String, operand: Label): String = {
    s"$opcode ${operand.name}"
  }

  private def formatInstr(opcode: String, operand1: Operand, operand2: Int): String = {
    s"$opcode ${formatOperand(operand1)}, ${operand2.toString}"
  }

  private def formatInstr(opcode: String): String = opcode

  def getParamReg(i: Int): String = paramRegs(i).reg.toLowerCase()

  private def formatOperand(operand: Operand): String = {
    operand match {
      case imm: Immediate => imm.value.toString
      case register: Register => register match {
        case param: paramReg => getParamReg(param.reg.replace("paramReg", "").toInt - 1)
        case sReg: scratchReg => if (sReg.reg.contains("scratchReg")) "r15" else sReg.reg
        case vReg: varReg => if (vReg.reg.contains("varReg")) "r1" +
          Math.min(vReg.reg.replace("varReg", "").last.asDigit, 5).toString else (vReg.reg)
        case _ => register.reg
      }
      case memory: Memory =>
        var size = (memory.size match {
          case 4 => "dword"
          case 8 => "qword"
          case _ => "word"
        }) + " ptr "
        val expr = memory.offset match {
          case None => ""
          case Some(OffsetInt(x)) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
          case Some(OffsetLabel(label)) =>
            size = ""
            s" + ${label.name}"
        }

        s"$size[${memory.primReg.get}$expr]"
    }
  }

}

//package backend
//
//import backend.IR.Size.{BIT_16, BIT_32, BIT_64, BIT_8, Size}
//import backend.x86IR._
//import backend.IR._
//import backend.x86IR.InstrSize._
//import backend.x86Registers._
//import backend.IRRegisters._
//
//import scala.collection.mutable.ListBuffer
//
//object x86Translator {
//
//  var paramRegs = ListBuffer(RDI(), RSI(), RDX(), RCX(), R8(), R9())
//  var varRegs = ListBuffer(R12(), R13(), R14(), R15())
//  var scratchRegs = ListBuffer(RBX())
//  var regMap:Map[Register, x86Register] = Map.empty
//
//  def translateIR(blocks: List[AsmBlock]): List[x86Block] = {
//    blocks.map(translateBlock)
//  }
//
//  def translateBlock(block: AsmBlock): x86Block = {
//    val x86block = new x86Block(x86Directive(""), x86Label(""), List.empty)
//    val instructions = block.instructions
//    for (instr <- instructions) {
//      val new_instr: List[x86Instruction] = instr match {
//        case AddInstr(src, dst, size) => translateAdd(src, dst, size)
//        case SubInstr(src, dst, size) => translateSub(src, dst, size)
//        case MulInstr(src, dst, size) => translateMul(src, dst, size)
//        case ModInstr(src, dst, size) => translateMod(src, dst, size)
//        case MovInstr(src, dst, size) => translateMov(src, dst, size)
//        case CallInstr(label) => List(Call(x86Label(label.name))):List[x86Instruction]
//        case LeaInstr(src:Register, value:Memory, size) => List(Lea(getMemory(value), getRegister(src), getSize(size))):List[x86Instruction]
//        case JeInstr(label) => List(Je(x86Label(label.name))):List[x86Instruction]
//        case JneInstr(label) => List(Jne(x86Label(label.name))):List[x86Instruction]
//        case MoveGT(reg, size) => List(Setg(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case MoveGTE(reg, size) => List(Setge(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case MoveLT(reg, size) => List(Setl(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case MoveLTE(reg, size) => List(Setle(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case MoveEq(reg, size) => List(Sete(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case MoveNEq(reg, size) => List(Setne(getRegister(reg), eigthReg), MoveSX(getRegister(reg), getRegister(reg), eigthReg, getSize(size)))
//        case IR.Push(reg, size) => List(x86IR.Push(getRegister(reg), getSize(size))):List[x86Instruction]
//        case IR.Pop(reg, size) => List(x86IR.Pop(getRegister(reg), getSize(size))):List[x86Instruction]
//        case Align(reg, size) => List(And(getRegister(reg), x86Immediate(-16), getSize(size)))
//        case Ret() => List(Return()):List[x86Instruction]
//      }
//
//      x86block.instructions = x86block.instructions.concat(new_instr)
//    }
//    x86block
//  }
//
//  private type BinaryFunc = (x86Operand, x86Operand, InstrSize) => x86Instruction
//
//
//  def translateBinary(func: BinaryFunc, src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
//    (src, dst) match {
//      case (src: Register, dst: Register) =>
//        List(func(getRegister(src), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
//
//      case (src: Register, dst: Memory) => {
//        List(Mov(getMemory(dst), R10(), fullReg), func(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
//      }
//
//      case (src: Register, dst: Immediate) => {
//        List.empty
//      }
//
//      case (src: Memory, dst: Register) => {
//        List(Mov(getMemory(src), R10(), fullReg), func(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
//      }
//
//      case (src: Memory, dst: Immediate) => {
//        List.empty
//      }
//
//      case (src: Immediate, dst: Register) => {
//        List(func(x86Immediate(src.value), new x86Register(dst.reg), getSize(size)))
//      }
//
//      case (src: Immediate, dst: Memory) => {
//        List.empty
//      }
//    }
//  }
//
//  // TODO: Change size to size - 1 and fix Immediates
//  def translateAdd(src: Operand, dst: x86Operand, instrSize: InstrSize): List[x86Instruction] = {
//    List(Add(src, dst, instrSize))
//  }
//
//  // TODO: Change size to size - 1 and fix Immediates
//  def translateSub(src: x86Operand, dst: x86Operand, instrSize: InstrSize): List[x86Instruction] = {
//    List(Sub(src, dst, instrSize))
//  }
//  // TODO: Change size to size - 1 and fix Immediates
//  def translateMul(src: x86Operand, dst: x86Operand, instrSize: InstrSize): List[x86Instruction] = {
//    List(Mul(src, dst, instrSize))
//  }
//
//  // TODO: Change size to size - 1 and fix Immediates
//  def translateMod(src: x86Operand, dst: x86Operand, instrSize: InstrSize): List[x86Instruction] = {
////    (src, dst) match {
////      case (src: Register, dst: Register) =>
////        List(Cmp(getRegister(dst), x86Immediate(0), halfReg), Je(x86Label("_errDivZero")), CDQ(), )
////
////      case (src: Register, dst: Memory) => {
////        List(Mov(getMemory(dst), R9(), fullReg), Mul(getRegister(src), R9(), halfReg), Jo(), MoveSX(R9(), R9(), halfReg, fullReg))
////      }
////
////      case (src: Register, dst: Immediate) => {
////        List.empty
////      }
////
////      case (src: Memory, dst: Register) => {
////        List(Mov(getMemory(src), R9(), fullReg), Mul(R9(), getRegister(dst), halfReg), Jo(), MoveSX(getRegister(dst), getRegister(dst), halfReg, fullReg))
////      }
////
////      case (src: Memory, dst: Immediate) => {
////        List.empty
////      }
////
////      case (src: Immediate, dst: Register) => {
////        List.empty
////      }
////
////      case (src: Immediate, dst: Memory) => {
////        List.empty
////      }
////    }
//    List.empty
//  }
//
//  // TODO: Change size to size - 1 and fix Immediates
//  def translateMov(src: Operand, dst: Operand, size: Size): List[x86Instruction] = {
//    (src, dst) match {
//      case (src: Register, dst: Register) =>
//        List(Mov(getRegister(src), getRegister(dst), getSize(size)))
//
//      case (src: Register, dst: Memory) => {
//        List(Mov(getRegister(src), getMemory(dst), getSize(size)))
//      }
//
//      case (src: Memory, dst: Register) => {
//        List(Mov(getMemory(src), getRegister(dst), getSize(size)))
//      }
//
//      case (src: Immediate, dst: Register) => {
//        List(Mov(x86Immediate(src.value), getRegister(dst), getSize(size)))
//      }
//
//      case (src: Immediate, dst: Memory) => {
//        List(Mov(x86Immediate(src.value), getMemory(dst), getSize(size)))
//      }
//    }
//  }
//
//  def getRegister(reg:Register): x86Register = {
//    reg match {
//      case _: paramReg => {
//        var returnVal:x86Register = null
//        if (regMap.contains(reg)) {
//          returnVal = regMap.get(reg).orNull
//        } else if (!paramRegs.isEmpty) {
//          returnVal = paramRegs.remove(0)
//          regMap = regMap + (reg-> returnVal)
//        } else {
//
//        }
//        returnVal
//      }
//      case _: varReg => {
//        var returnVal: x86Register = null
//        if (regMap.contains(reg)) {
//          returnVal = regMap.get(reg).orNull
//        } else if (!varRegs.isEmpty) {
//          returnVal = varRegs.remove(0)
//          regMap = regMap + (reg-> returnVal)
//        } else {
//
//        }
//        returnVal
//      }
//      case _: scratchReg => {
//        var returnVal: x86Register = null
//        if (regMap.contains(reg)) {
//          returnVal = regMap.get(reg).orNull
//        } else if (!scratchRegs.isEmpty) {
//          returnVal = scratchRegs.remove(0)
//          regMap = regMap + (reg-> returnVal)
//        } else {
//
//        }
//        returnVal
//      }
//
//    }
//  }
//
//  def getSize(size:Size): InstrSize = {
//    size match {
//      case BIT_64 => fullReg
//      case BIT_32 => halfReg
//      case BIT_16 => quarterReg
//      case BIT_8 => eigthReg
//    }
//  }
//
//  def getMemory(mem: Memory): x86Memory = {
//    val primReg = mem.primReg.map(reg => new x86Register(reg.reg))
//    val secReg = mem.secReg.map(reg => new x86Register(reg.reg))
//    val multiplier = mem.multiplier
//    val offset = mem.offset.map {
//      case OffsetInt(value) => x86OffsetInt(value)
//      case OffsetLabel(label) => x86OffsetLabel(new x86Label(label.name))
//    }
//
//    x86Memory(primReg, secReg, multiplier, offset)
//  }
//
//}