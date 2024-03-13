package backend

import backend.x86IR.InstrSize._
import backend.x86IR._

object IntelX86Formatter {
  private val stackAlignmentMask: Int = -16

  def translate(asmInstr: List[x86Block]): String = {
    ".intel_syntax noprefix\n.globl main\n" +
      asmInstr.map(convertBlock).mkString("").strip() + "\n"
  }

  def convertBlock(block: x86Block): String = {
    block.roData.map(convertROData).getOrElse("") +
      block.directive.map(convertDir).getOrElse("") +
      convertLabel(block.label) +
      convertInstrs(block.instructions)
  }

  def convertROData(rodata: x86ReadOnlyData): String = {
    val rodStr: StringBuilder = new StringBuilder(".section .rodata\n")

    for (i <- rodata.data.indices) {
      rodata.data(i) match {
        case (n: Int, str: String) =>
          val labelName = if (rodata.labelName.isEmpty) "" else s"_${rodata.labelName}_"
          rodStr.append(
            s"""|\t.int $n
                |.L.${labelName}str$i:
                |\t.asciz \"$str\"\n""".stripMargin)
      }
    }

    rodStr.toString()
  }

  private def convertDir(dir: x86Directive): String = if (dir.name.isEmpty) "" else s".${dir.name}\n"

  private def convertLabel(label: x86Label): String = if (label.name.isEmpty) "" else s"${label.name}:\n"

  private def convertInstrs(instrs: List[x86Instruction]): String = {
    instrs match {
      case Nil => ""
      case instr :: Nil => s"\t${convertInstr(instr)}\n\n"
      case head :: tail => s"\t${convertInstr(head)}\n" + convertInstrs(tail)
    }
  }

  private def convertInstr(instr: x86Instruction): String = {
    instr match {
      case Push(reg, size) => formatInstr("push", reg, size)
      case Pop(reg, size) => formatInstr("pop", reg, size)
      case Return() => formatInstr("ret")
      case CDQ() => formatInstr("cdq")
      case Mov(src, dst, size) => formatInstr("mov", src, dst, size)
      case CMov(src, dst, size) => formatInstr("cmov", src, dst, size)
      case CMovNe(src, dst, size) => formatInstr("cmovne", src, dst, size)
      case MoveSX(src, dst, sizeSrc, sizeDst) => formatInstr("movsx", src, dst, sizeSrc, sizeDst)
      case Call(label) => formatInstr("call", label)
      case Add(reg1, reg2, size) => formatInstr("add", reg1, reg2, size)
      case Sub(value, reg, size) => formatInstr("sub", value, reg, size)
      case Mul(value, reg, size) => formatInstr("imul", value, reg, size)
      case IDiv(reg, _, size) => formatInstr("idiv", reg, size)
      case And(reg1, reg2, size) => formatInstr("and", reg2, reg1, size)
      case Or(reg1, reg2, size) => formatInstr("or", reg2, reg1, size)
      case Sete(reg, size) => formatInstr("sete", reg, size)
      case Setne(reg, size) => formatInstr("setne", reg, size)
      case Setg(reg, size) => formatInstr("setg", reg, size)
      case Setge(reg, size) => formatInstr("setge", reg, size)
      case Setl(reg, size) => formatInstr("setl", reg, size)
      case Setle(reg, size) => formatInstr("setle", reg, size)
      case Je(label) => formatInstr("je", label)
      case Jl(label) => formatInstr("jl", label)
      case Jge(label) => formatInstr("jge", label)
      case Jne(label) => formatInstr("jne", label)
      case Jump(label) => formatInstr("jmp", label)
      case Jo() => formatInstr("jo", new x86Label("_errOverflow"))
      case CMovL(register, register1, size) => formatInstr("cmovl", register, register1, size)
      case CMovGE(register, register1, size) => formatInstr("cmovge", register, register1, size)
      case Cmp(op1, op2, size) => formatInstr("cmp", op1, op2, size)
      case Test(op1, op2, size) => formatInstr("test", op1, op2, size)
      case Lea(reg, mem, size) => formatInstr("lea", reg, mem, size)
    }
  }

  private def formatInstr(opcode: String, operand1: x86Operand, operand2: x86Operand, size: InstrSize): String = {
    s"$opcode ${formatOperand(operand2, size)}, ${formatOperand(operand1, size)}"
  }

  private def formatInstr(opcode: String, operand1: x86Operand, operand2: x86Operand, size1: InstrSize, size2: InstrSize): String = {
    s"$opcode ${formatOperand(operand2, size2)}, ${formatOperand(operand1, size1)}"
  }

  private def formatInstr(opcode: String, operand: x86Operand, size: InstrSize): String = {
    s"$opcode ${formatOperand(operand, size)}"
  }

  private def formatInstr(opcode: String, operand: x86Label): String = {
    s"$opcode ${operand.name}"
  }

  private def formatInstr(opcode: String, operand1: x86Operand, operand2: Int, size: InstrSize): String = {
    s"$opcode ${formatOperand(operand1, size)}, ${operand2.toString}"
  }

  private def formatInstr(opcode: String): String = opcode

  private def formatOperand(operand: x86Operand, size: InstrSize): String = {
    operand match {
      case imm: x86Immediate => imm.value.toString
      case register: x86Register => register.reg
      case registers: x86Registers => registers.get(size).reg
      case memory: x86Memory =>
        val wordPrefix: String = size match {
          case InstrSize.fullReg => "qword"
          case InstrSize.halfReg => "dword"
          case InstrSize.quarterReg => "word"
          case InstrSize.eigthReg => "byte"
        }
        var wordSize: String = s"${wordPrefix} ptr "
        val expr = memory.offset match {
          case None => ""
          case Some(x86OffsetInt(x)) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
          case Some(x86OffsetLabel(label)) =>
            wordSize = ""
            s" + ${label.name}"
        }

        if (memory.primReg.isDefined && memory.secReg.isDefined && memory.multiplier.isDefined) {
          s"$wordSize[${memory.primReg.get.reg64Bit} + ${memory.secReg.get.reg64Bit} * ${memory.multiplier.get}$expr]"
        } else {
          s"$wordSize[${memory.primReg.get.reg64Bit}$expr]"
        }
    }
  }

}
