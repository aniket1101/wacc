package backend

import backend.IR._
import backend.x86IR.InstrSize.fullReg
import backend.x86IR._
import backend.x86Registers._
object IntelX86Formatter {
    private val stackAlignmentMask: Int = -16

    def translate(asmInstr: List[x86Block]): String = {
      ".intel_syntax noprefix\n.globl main\n" +
        asmInstr.map(convertBlock).mkString("").strip() + "\n"
    }

    def convertBlock(block: x86Block): String = {
      convertROData(block.roData.get) +
      block.directive.map(convertDir).getOrElse("") +
        convertLabel(block.label) +
        convertInstrs(block.instructions)
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

    private def convertInstrs(instrs: List[x86Instruction]): String = {
      instrs match {
        case Nil => ""
        case instr :: Nil => s"\t${convertInstr(instr)}\n\n"
        case head :: tail => s"\t${convertInstr(head)}\n" + convertInstrs(tail)
      }
    }

    private def convertInstr(instr: x86Instruction): String = {
      instr match {
        case x86IR.Push(reg, size) => formatInstr("push", reg)
        case x86IR.Pop(reg, size) => formatInstr("pop", reg)
        case Return() => formatInstr("ret")
        case CDQ() => formatInstr("cdq")
        case Mov(src, dst, size) => formatInstr("mov", src, dst)
        case MoveSX(src, dst, sizeSrc, sizeDst) => formatInstr("movsx", src, dst)
        case Call(label) => formatInstr("call", label)
        case Add(reg1, reg2, size) => formatInstr("add", reg1, reg2)
        case Sub(value, reg, size) => formatInstr("sub", value, reg)
        case Mul(value, reg, size) => formatInstr("imul", value, reg)
        case And(reg1, reg2, size) => formatInstr("and", reg1, reg2)
        case Sete(reg, size) => formatInstr("sete", reg)
        case Setne(reg, size) => formatInstr("setne", reg)
        case Setg(reg, size) => formatInstr("setg", reg)
        case Setge(reg, size) => formatInstr("setge", reg)
        case Setl(reg, size) => formatInstr("setl", reg)
        case Setle(reg, size) => formatInstr("setle", reg)
        case Je(label) => formatInstr("je", label)
        case Jne(label) => formatInstr("jne", label)
        case Jump(label) => formatInstr("jmp", label)
        case Cmp(op1, op2, size) => formatInstr("cmp", op1, op2)
        case Lea(reg, mem, size) => formatInstr("lea", reg, mem)
      }
    }

    private def formatInstr(opcode: String, operand1: x86Operand, operand2: x86Operand): String = {
      s"$opcode ${formatOperand(operand2)}, ${formatOperand(operand1)}"
    }

    private def formatInstr(opcode: String, operand: x86Operand): String = {
      s"$opcode ${formatOperand(operand)}"
    }

    private def formatInstr(opcode: String, operand: x86Label): String = {
      s"$opcode ${operand.name}"
    }

    private def formatInstr(opcode: String, operand1: x86Operand, operand2: Int): String = {
      s"$opcode ${formatOperand(operand1)}, ${operand2.toString}"
    }

    private def formatInstr(opcode: String): String = opcode

    private def formatOperand(operand: x86Operand): String = {
      operand match {
        case imm: x86Immediate => imm.value.toString
        case register: x86Register => register.reg
        case registers: x86Registers => registers.get(fullReg).reg
        case memory: x86Memory =>
          var size = "dword ptr "
          val expr = memory.offset match {
            case None => ""
            case Some(x86OffsetInt(x)) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
            case Some(x86OffsetLabel(label)) =>
              size = ""
              s" + ${label.name}"
          }

          s"$size[${memory.primReg.get.reg64Bit}$expr]"
      }
    }

}
