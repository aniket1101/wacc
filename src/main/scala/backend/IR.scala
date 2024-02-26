package backend
import IRRegisters._
import IRTranslator.{getParamReg, translatePrint}
import backend.IR.{Label, Ret}
import frontend.ast.StringType

import scala.collection.mutable.ListBuffer

object IR {

  sealed trait Instruction

  case class Label(name: String)
  case class Directive(name: String)

  sealed trait Operand

  sealed trait MemOrReg extends Operand
  sealed trait RegOrImm extends Operand

  case class Immediate(value: Int) extends RegOrImm
  class Register(val reg: String) extends MemOrReg with RegOrImm {
    def address():Int = 0

    override def toString: String = reg
  }

  sealed trait Offset

  case class OffsetInt(value: Int) extends Offset

  case class OffsetLabel(label: Label) extends Offset

  sealed abstract case class Memory(primReg: Option[Register], secReg: Option[Register], multiplier: Option[Int], offset: Option[Offset]) extends MemOrReg {
    def this(primReg: Register, offset: Int) = this(Some(primReg), None, None, if (offset != 0) Some(OffsetInt(offset)) else None)

    def this(primReg: Register, secReg: Register) = this(Some(primReg), Some(secReg), None, None)

    def this(primReg: Register, secReg: Register, multiplier: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None)
    }

    def this(secReg: Register, multiplier: Int, offset: Int) = {
      this (None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None)
    }

    def this(primReg: Register, secReg: Register, multiplier: Int, offset: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None)
    }
  }
  object Memory {
    def apply(primReg: Register): Memory = new Memory(Some(primReg), None, None, None) {}
    def apply(primReg: Register, offset: Int):Memory = new Memory(Some(primReg), None, None, Some(OffsetInt(offset))) {}
    def apply(primReg: Register, label: Label):Memory = new Memory(Some(primReg), None, None, Some(OffsetLabel(label))) {}
  }

  // ADD instruction
  sealed abstract case class AddInstr(src: Operand, dst: Operand) extends Instruction
  object AddInstr {
    def apply(src:Register, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Register, dst:Memory):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Register, dst:Immediate):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Memory, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Memory, dst:Immediate):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Immediate, dst:Register):AddInstr = new AddInstr(src, dst) {}
    def apply(src:Immediate, dst:Memory):AddInstr = new AddInstr(src, dst) {}
  }

  sealed abstract case class SubInstr(src: Operand, dst: Operand) extends Instruction
  object SubInstr {
    def apply(src: Register, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Register, dst: Memory): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Memory, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): SubInstr = new SubInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): SubInstr = new SubInstr(src, dst) {}
  }

  sealed abstract case class MulInstr(src: Operand, dst: Operand) extends Instruction
  object MulInstr {
    def apply(src: Register, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Register, dst: Memory): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Memory, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): MulInstr = new MulInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): MulInstr = new MulInstr(src, dst) {}
  }

  // Mod Instruction
  sealed abstract case class ModInstr(src: Operand, dst: Operand) extends Instruction
  object ModInstr {
    def apply(src: Register, dst: Register): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Register, dst: Memory): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Memory, dst: Register): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Memory, dst: Immediate): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): ModInstr = new ModInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): ModInstr = new ModInstr(src, dst) {}
  }

  // XOR instruction
  sealed abstract case class XORInstr(src: Operand, dst: Operand) extends Instruction
  object XORInstr {
    def apply(src: Register, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Register, dst: Memory): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Memory, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Memory, dst: Immediate): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): XORInstr = new XORInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): XORInstr = new XORInstr(src, dst) {}
  }

  // MOV instruction
  sealed abstract case class MovInstr(src: Operand, dst: Operand) extends Instruction
  object MovInstr {
    def apply(src: Register, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Register, dst: Memory): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Memory, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): MovInstr = new MovInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): MovInstr = new MovInstr(src, dst) {}
  }

  case class CallInstr(label:Label) extends Instruction

  sealed abstract case class CmpInstr(src: Operand, value: Operand) extends Instruction
  object CmpInstr {
    def apply(src: Immediate, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Memory, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Register, dst: Register): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Immediate, dst: Register): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Register, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}
    def apply(src: Immediate, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}
  }

  sealed abstract case class LeaInstr(src: Operand, value: Operand) extends Instruction

  object LeaInstr {
    def apply(src: Memory, dst: Register): LeaInstr = new LeaInstr(src, dst) {}
  }

  case class JeInstr(label: Label) extends Instruction
  case class JgeInstr(label: Label) extends Instruction
  case class JlInstr(label: Label) extends Instruction
  case class JleInstr(label: Label) extends Instruction
  case class JneInstr(label: Label) extends Instruction
  case class JumpInstr(label: Label) extends Instruction

  case class MoveGT(reg:Register) extends Instruction
  case class MoveGTE(reg:Register) extends Instruction
  case class MoveLT(reg:Register) extends Instruction
  case class MoveLTE(reg:Register) extends Instruction
  case class MoveEq(reg:Register) extends Instruction
  case class MoveNEq(reg:Register) extends Instruction

  case class Push(reg: Register) extends Instruction
  case class Pop(reg: Register) extends Instruction

  case class Align(reg: Register) extends Instruction
  case class Ret() extends Instruction

  sealed trait Block
  class AsmBlock(val directive: Directive, val label: Label, var instructions: List[Instruction]) extends Block {
    override def toString: String = {
      s"$directive\n$label:\n" + instructions.map(instr => s"\t$instr").mkString("\n") + "\n"
    }
  }

  case class ExitBlock() extends AsmBlock(Directive(""), Label("_exit"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CallInstr(Label("exit@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class StringPrintBlock() extends AsmBlock(Directive("text"), Label("_prints"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(new scratchReg("rdi"), new scratchReg("rdx")),
    MovInstr(Memory(new scratchReg("rdi"), -4), new scratchReg("esi")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._prints_str0")), new scratchReg("rdi")),
    MovInstr(Immediate(0), new sc
    ratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class CharPrintBlock() extends AsmBlock(Directive("text"), Label("_printc"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(new scratchReg("dil"), new scratchReg("sil")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printc_str0")), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(StackPointer(), BasePointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class BoolPrintBlock() extends AsmBlock(Directive("text"), Label("_printb"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CmpInstr(Immediate(0), paramRegOne),
    JneInstr(Label(".L_printb0")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str0")), new scratchReg("rdx")),
    JumpInstr(Label(".L_printb1"))
  ))

  case class BoolPrintBlock0() extends AsmBlock(Directive("text"), Label("_printb0"), List(
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str1")), new scratchReg("rdx"))
  ))

  case class BoolPrintBlock1() extends AsmBlock(Directive("text"), Label("_printb1"), List(
    MovInstr(Memory(new scratchReg("rdx"), -4), new scratchReg("esi")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str2")), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class IntPrintBlock() extends AsmBlock(Directive("text"), Label("_printi"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(paramRegOne, new scratchReg("esi")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printi_str0")), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  class ReadOnlyData() extends Block {
    val strings: ListBuffer[String] = ListBuffer()

    def add(str: String): Unit = strings.addOne(str)
    override def toString: String = {
      s".section .rodata\n" + strings.map(str => s".L.str${strings.indexOf(str)}:\n\t.asciz \"$str\"").mkString("\n") + "\n"
    }

    def prevString(): Label = Label(s".L.str${strings.length-1}")
  }

  class StringPrintBlockROData() extends ReadOnlyData() {
    override def toString: String = {
      ".section .rodata\n\t.int 4\n.L._prints_str0:\n\t.asciz \"%.*s\"\n"
    }
  }

  class CharPrintBlockROData() extends ReadOnlyData() {
    override def toString: String = {
      ".section .rodata\n\t.int 2\n.L._printc_str0:\n\t.asciz \"%c\"\n"
    }
  }

  class IntPrintBlockROData() extends ReadOnlyData() {
    override def toString: String = {
      ".section .rodata\n\t.int 2\n.L._printi_str0:\n\t.asciz \"%d\"\n"
    }
  }

  class BoolPrintBlockROData() extends ReadOnlyData() {
    override def toString: String = {
      ".section .rodata\n\t.int 5\n.L._printb_str0:\n\t.asciz \"false\"\n\t.int 4\n.L._printb_str1:\n\t.asciz \"true\"\n\t.int 4\n.L._printb_str2:\n\t.asciz \"%.*s\"\n"
    }
  }

  case class PrintlnBlock() extends AsmBlock(Directive("text"), Label("_println"), List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._println_str0")), new scratchReg("rdi")),
    CallInstr(Label("puts@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  class PrintlnBlockROData() extends ReadOnlyData() {
    override def toString: String = {
      ".section .rodata\n\t.int 0\n.L._println_str0:\n\t.asciz \"\"\n"
    }
  }
}
