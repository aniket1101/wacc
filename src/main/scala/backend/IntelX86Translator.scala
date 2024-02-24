package backend

import backend.IR._
import backend.IRRegisters.paramReg

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

class IntelX86Translator {
  private val stackAlignmentMask: Int = -16
  private val paramRegs: List[Register] = List(new paramReg("RDI"), new paramReg("RSI"), new paramReg("RCX"), new paramReg("R8"), new paramReg("R9"))
  def toAsmCode(asmInstr: ListBuffer[AsmBlock]): String = {
    ".intel_syntax noprefix\n.globl main\n.section .rodata\n" +
    asmInstr.map({
      case block: AsmBlock => convertDir(block.directive) +
      convertLabel(block.label) + convertInstrs(block.instructions)
    }).mkString("").strip() + "\n"
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
      case Push(reg) =>               formatInstr("push", reg)
      case Pop(reg) =>                formatInstr("pop", reg)
      case Ret() =>                   formatInstr("ret")
      case MovInstr(src, dst) =>      formatInstr("mov", src, dst)
      case CallInstr(label) =>        formatInstr("call", label)
      case Align(reg) =>              formatInstr("and", reg, stackAlignmentMask)
      case AddInstr(reg1, reg2) =>    formatInstr("add", reg1, reg2)
      case SubInstr(value, reg) =>    formatInstr("sub", value, reg)
      case MulInstr(value, reg) =>    formatInstr("imul", value, reg)
      case JeInstr(label) =>          formatInstr("je", label)
      case JumpInstr(label) =>        formatInstr("jmp", label)
      case CmpInstr(op1, op2) =>      formatInstr("cmp", op1, op2)
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
        case param: paramReg => getParamReg(param.reg.replace("paramReg", "").toInt-1)
        case _ => register.reg
      }
      case memory: Memory =>
        val expr = memory.offset match {
        case None => ""
        case Some(x) => s" ${if (x > 0) "+" else "-"} ${Math.abs(x)}"
      }
        s"qword ptr [${memory.primReg.get}$expr]"
    }
  }

}
