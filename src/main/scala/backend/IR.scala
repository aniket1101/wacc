package backend
import backend.IRRegisters._

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

  sealed abstract case class Memory(primReg: Option[Register], secReg: Option[Register], multiplier: Option[Int], offset: Option[Offset], size: Int) extends MemOrReg {
    def this(primReg: Register, offset: Int, size: Int) = this(Some(primReg), None, None, if (offset != 0) Some(OffsetInt(offset)) else None, size)

    def this(primReg: Register, secReg: Register, size: Int) = this(Some(primReg), Some(secReg), None, None, size)

    def this(primReg: Register, secReg: Register, multiplier: Int, size: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None, size)
    }

    def this(secReg: Register, multiplier: Int, offset: Int, size: Int) = {
      this (None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None, size)
    }

    def this(primReg: Register, secReg: Register, multiplier: Int, offset: Int, size: Int) = {
      this (Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None, size)
    }
  }
  object Memory {
    def apply(primReg: Register, size: Int): Memory = new Memory(Some(primReg), None, None, None, size) {}
    def apply(primReg: Register, offset: Int, size: Int):Memory = new Memory(Some(primReg), None, None, Some(OffsetInt(offset)), size) {}
    def apply(primReg: Register, label: Label, size: Int):Memory = new Memory(Some(primReg), None, None, Some(OffsetLabel(label)), size) {}
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

  sealed abstract case class DivInstr(src: Operand, dst: Operand) extends Instruction

  object DivInstr {
    def apply(src: Register, dst: Register): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Register, dst: Memory): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Memory, dst: Register): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Memory, dst: Immediate): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): DivInstr = new DivInstr(src, dst) {}
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

  class AsmBlock (var roData: Option[ReadOnlyData], val directive: Option[Directive], val label: Label, var instructions: List[Instruction]) extends Block {
    def this(label: String, instructions: List[Instruction]) = this(Option.empty, Option.empty, Label(label), instructions)
    def this(directive: String, label: String, instructions: List[Instruction]) = this(Option.empty, Option(Directive(directive)), Label(label), instructions)
    def this(roData: ReadOnlyData, label: String, instructions: List[Instruction]) = this(Option(roData), Option.empty, Label(label), instructions)
    def this(roData: ReadOnlyData, directive: String, label: String, instructions: List[Instruction]) = this(Option(roData), Option(Directive(directive)), Label(label), instructions)

    def this(label: Label, instructions: List[Instruction]) = this(Option.empty, Option.empty, label, instructions)

    def this(directive: String, label: Label, instructions: List[Instruction]) = this(Option.empty, Option(Directive(directive)), label, instructions)

    def this(roData: ReadOnlyData, label: Label, instructions: List[Instruction]) = this(Option(roData), Option.empty, label, instructions)

    def this(roData: ReadOnlyData, directive: String, label: Label, instructions: List[Instruction]) = this(Option(roData), Option(Directive(directive)), label, instructions)
    def addROData(roData: ReadOnlyData) = {this.roData = Option(roData)}
  }

  case class ExitBlock() extends AsmBlock("_exit", List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CallInstr(Label("exit@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class StringPrintBlock() extends AsmBlock(new ReadOnlyData("prints", 4, "%.*s"), "text","_prints", List(
    Push(BasePointer()),
      MovInstr(StackPointer(), BasePointer()),
      Align(StackPointer()),
      MovInstr(new scratchReg("rdi"), new scratchReg("rdx")),
      MovInstr(Memory(new scratchReg("rdi"), -4, 4), new scratchReg("esi")),
      LeaInstr(Memory(new scratchReg("rip"), Label(".L._prints_str0"), 4), new scratchReg("rdi")),
      MovInstr(Immediate(0), new scratchReg("al")),
      CallInstr(Label("printf@plt")),
      MovInstr(Immediate(0), new scratchReg("rdi")),
      CallInstr(Label("fflush@plt")),
      MovInstr(BasePointer(), StackPointer()),
      Pop(BasePointer()),
      Ret()
  ))

  case class CharPrintBlock() extends AsmBlock(new ReadOnlyData("printc", 2, "%c"), "text", "_printc", List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(new scratchReg("dil"), new scratchReg("sil")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printc_str0"), 4), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  val boolROData = new ReadOnlyData("printb", ListBuffer((5, "false"), (4, "true"), (4, "%.*s")))

  case class BoolPrintBlock() extends AsmBlock(boolROData, "text", "_printb", List(
      Push(BasePointer()),
      MovInstr(StackPointer(), BasePointer()),
      Align(StackPointer()),
      CmpInstr(Immediate(0), new scratchReg("dil")),
      JneInstr(Label(".L_printb0")),
      LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str0"), 4), new scratchReg("rdx")),
      JumpInstr(Label(".L_printb1"))
    ))

  case class BoolPrintBlock0() extends AsmBlock("text", ".L_printb0", List(
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str1"), 4), new scratchReg("rdx"))
  ))

  case class BoolPrintBlock1() extends AsmBlock("text", ".L_printb1", List(
    MovInstr(Memory(new scratchReg("rdx"), -4, 4), new scratchReg("esi")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printb_str2"), 4), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class IntPrintBlock() extends AsmBlock(new ReadOnlyData("printi", 2, "%d"), "text", "_printi", List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(new scratchReg("edi"), new scratchReg("esi")),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._printi_str0"), 4), new scratchReg("rdi")),
    MovInstr(Immediate(0), new scratchReg("al")),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class PrintlnBlock() extends AsmBlock(new ReadOnlyData("println", 0, ""), "text","_println", List(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    LeaInstr(Memory(new scratchReg("rip"), Label(".L._println_str0"), 4), new scratchReg("rdi")),
    CallInstr(Label("puts@plt")),
    MovInstr(Immediate(0), new scratchReg("rdi")),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

//  case class MallocBlock() extends AsmBlock("text", "_printi", List(
//    Push(BasePointer()),
//    MovInstr(StackPointer(), BasePointer()),
//    Align(StackPointer()),
//    CallInstr(Label("malloc@plt")),
//    CmpInstr(Immediate(0), new scratchReg("Rax")),
//    JeInstr(Label("_errOutOfMemory")),
//    MovInstr(BasePointer(), StackPointer()),
//    Pop(BasePointer()),
//    Ret()
//  ))

  class ReadOnlyData(val labelName: String, val data: ListBuffer[(Int, String)]) extends Block {
    def this(labelName: String) = this(labelName, ListBuffer.empty: ListBuffer[(Int, String)])
    def this(labelName: String, n: Int, str: String) = this(labelName, ListBuffer((n, str)))
    def this(labelName: String, str: String) = this(labelName, ListBuffer((str.length, str)))

    def add(str: String): Unit = data.addOne((str.length, formatStr(str)))
    def add(n: Int, str: String): Unit = data.addOne((n, formatStr(str)))
    private def formatStr(str: String):String = str.replace("\n", "\\n").replace("\b", "\\b")

    def prevString(): Label = Label(s".L.str${data.length-1}")
  }
}
