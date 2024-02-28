package backend

import backend.IR._
import backend.IRRegisters.paramReg

class IntelX86Translator {
  private val stackAlignmentMask: Int = -16
  private val paramRegs: List[Register] = List(new paramReg("RDI"), new paramReg("RSI"), new paramReg("RCX"), new paramReg("R8"), new paramReg("R9"))
  def toAsmCode(asmInstr: List[Block]): String = {
//    ".intel_syntax noprefix\n.globl main\n" +
//    asmInstr.map({
//      case block: AsmBlock => convertDir(block.directive) +
//      convertLabel(block.label) + convertInstrs(block.instructions)
//      case rodata: ReadOnlyData => convertROData(rodata)
//    }).mkString("").strip() + "\n"
    ???
  }

//  def convertROData(rodata: ReadOnlyData): String = {
//    rodata match {
//      case rod: PrintBlockROData => {
//        rod.toString
//      }
//      case rod: PrintlnBlockROData => {
//        rod.toString
//      }
//      case rodata =>
//        val rod: StringBuilder = new StringBuilder(".section .rodata\n")
//        for (i <- rodata.strings.indices) {
//          val str = rodata.strings(i)
//          rod.append(s"\t.int ${str.length}\n")
//          rod.append(s".L.str$i:\n")
//          rod.append(s"\t.asciz \"$str\"\n")
//        }
//        rod.toString()
//    }
//
//  }
//
//  private def convertDir(dir: Directive): String = if (dir.name.isEmpty) "" else s".${dir.name}\n"
//  private def convertLabel(label: Label): String = if (label.name.isEmpty) "" else s"${label.name}:\n"
//  private def convertInstrs(instrs: List[Instruction]): String = {
//    instrs match {
//      case Nil => ""
//      case instr :: Nil => s"\t${convertInstr(instr)}\n\n"
//      case head :: tail => s"\t${convertInstr(head)}\n" + convertInstrs(tail)
//    }
//  }
//
//  private def convertInstr(instr: Instruction): String = {
//    instr match {
//      case Push(reg, size) =>               formatInstr("push", reg)
//      case Pop(reg, size) =>              formatInstr("pop", reg)
//      case Ret() =>                         formatInstr("ret")
//      case MovInstr(src, dst, size) =>    formatInstr("mov", src, dst)
//      case CallInstr(label) =>              formatInstr("call", label)
//      case Align(reg, size) =>              formatInstr("and", reg, stackAlignmentMask)
//      case AddInstr(reg1, reg2, size) =>    formatInstr("add", reg1, reg2)
//      case SubInstr(value, reg, size) =>    formatInstr("sub", value, reg)
//      case MulInstr(value, reg, size) =>    formatInstr("imul", value, reg)
//      case JeInstr(label) =>                formatInstr("je", label)
//      case JneInstr(label) =>               formatInstr("jne", label)
//      case JumpInstr(label) =>              formatInstr("jmp", label)
//      case CmpInstr(op1, op2, size) =>      formatInstr("cmp", op1, op2)
//      case LeaInstr(reg, mem, size) =>      formatInstr("lea", reg, mem)
//      case ModInstr(reg1, reg2, size) =>    formatInstr("mod", reg1, reg2)
//      case MoveEq(reg, size) =>             formatInstr("meq", reg)
//      case MoveNEq(reg, size) =>            formatInstr("mneq", reg)
//      case MoveLT(reg, size) =>             formatInstr("mlt", reg)
//      case MoveLTE(reg, size) =>            formatInstr("mlte", reg)
//      case MoveGT(reg, size) =>             formatInstr("mgt", reg)
//      case MoveGTE(reg, size) =>            formatInstr("mgte", reg)
//    }
//  }
//
//  private def formatInstr(opcode: String, operand1: Operand, operand2: Operand): String = {
//    s"$opcode ${formatOperand(operand2)}, ${formatOperand(operand1)}"
//  }
//
//  private def formatInstr(opcode: String, operand: Operand): String = {
//    s"$opcode ${formatOperand(operand)}"
//  }
//
//  private def formatInstr(opcode: String, operand: Label): String = {
//    s"$opcode ${operand.name}"
//  }
//
//  private def formatInstr(opcode: String, operand1: Operand, operand2: Int): String = {
//    s"$opcode ${formatOperand(operand1)}, ${operand2.toString}"
//  }
//
//  private def formatInstr(opcode: String): String = opcode
//
//  def getParamReg(i: Int): String = paramRegs(i).reg.toLowerCase()
//
//  private def formatOperand(operand: Operand): String = {
//    operand match {
//      case imm: Immediate => imm.value.toString
//      case register: Register => register match {
//        case param: paramReg => getParamReg(param.reg.replace("paramReg", "").toInt-1)
//        case _ => register.reg
//      }
//      case memory: Memory =>
//        var size = "dword ptr "
//        val expr = memory.offset match {
//          case None => ""
//          case Some(OffsetInt(x)) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
//          case Some(OffsetLabel(label)) =>
//            size = ""
//            s" + ${label.name}"
//        }
//
//        s"$size[${memory.primReg.get}$expr]"
//    }
//  }

}
