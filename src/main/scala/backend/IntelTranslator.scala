package backend

import backend.x86IR._
import backend.x86Registers._
object IntelTranslator {
    private val stackAlignmentMask: Int = -16
    private val paramRegs: List[x86Register] = List(RDI(), RSI(), RDX(), RCX(), R8(), R9())

    def translate(asmInstr: List[x86Block]): String = {
      ".intel_syntax noprefix\n.globl main\n" +
        asmInstr.map({
          case block: x86Block => convertDir(block.directive) +
            convertLabel(block.label) + convertInstrs(block.instructions)
//          case rodata: ReadOnlyData => convertROData(rodata)
        }).mkString("").strip() + "\n"
    }

//    def convertROData(rodata: ReadOnlyData): String = {
//      rodata match {
//        case rod: PrintBlockROData => {
//          rod.toString
//        }
//        case rod: PrintlnBlockROData => {
//          rod.toString
//        }
//        case rodata =>
//          val rod: StringBuilder = new StringBuilder(".section .rodata\n")
//          for (i <- rodata.strings.indices) {
//            val str = rodata.strings(i)
//            rod.append(s"\t.int ${str.length}\n")
//            rod.append(s".L.str$i:\n")
//            rod.append(s"\t.asciz \"$str\"\n")
//          }
//          rod.toString()
//      }
//
//    }

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
        case Push(reg, size) => formatInstr("push", reg)
        case Pop(reg, size) => formatInstr("pop", reg)
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

    def getParamReg(i: Int): String = paramRegs(i).reg.toLowerCase()

    private def formatOperand(operand: x86Operand): String = {
      operand match {
        case imm: x86Immediate => imm.value.toString
        case register: x86Register => register match {
          case param: parameterReg => getParamReg(param.reg.replace("paramReg", "").toInt - 1)
          case _ => register.reg
        }
        case memory: x86Memory =>
          var size = "dword ptr "
          val expr = memory.offset match {
            case None => ""
            case Some(x86OffsetInt(x)) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
            case Some(x86OffsetLabel(label)) =>
              size = ""
              s" + ${label.name}"
          }

          s"$size[${memory.primReg.get}$expr]"
      }
    }

}
