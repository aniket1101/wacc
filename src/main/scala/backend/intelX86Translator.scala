package backend

import backend.IR._

object intelX86Translator {
  val stackAlignmentMask: Int = -16
  def toAsmCode(asmInstr: List[Block]): String = {
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
      case Push(reg) => s"push ${reg.reg}"
      case Pop(reg) =>  s"pop ${reg.reg}"
      case Ret() => "ret"
      case MovRegister(src, dst) => "mov " + {
        dst match {
          case imm: Immediate => imm.value
          case reg: Register => reg.reg
          case memory: Memory => memory.toString
        }
      } + s", ${src.reg}"
      case MovImm(src, dst) => "mov " + {
        dst match {
          case reg: Register => reg.reg
          case memory: Memory => memory.toString
        }
      } + s", ${src.value}"
      case Call(label) => s"call ${label.name}"
      case Align(reg) => s"and ${reg.reg}, $stackAlignmentMask"
    }
  }
}
