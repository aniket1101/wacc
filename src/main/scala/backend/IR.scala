package backend
import IRRegisters._
import backend.Size._

import scala.collection.mutable.ListBuffer

object IR {

  sealed trait Instruction

  case class Label(name: String) {
    def this(label: Label) = this(label.name)
  }

  case class Directive(name: String) {
    def this(directive: Directive) = this(directive.name)
  }

  sealed trait Operand

  sealed trait MemOrReg extends Operand

  sealed trait RegOrImm extends Operand

  case class Immediate(value: Int) extends RegOrImm

  class Register() extends MemOrReg with RegOrImm

  sealed trait Offset

  case class OffsetInt(value: Int) extends Offset

  case class OffsetLabel(label: Label) extends Offset

  sealed abstract case class Memory(primReg: Option[Register], secReg: Option[Register], multiplier: Option[Int], offset: Option[Offset]) extends MemOrReg {
    def this(primReg: Register, offset: Int) = this(Some(primReg), None, None, if (offset != 0) Some(OffsetInt(offset)) else None)

    def this(primReg: Register, secReg: Register) = this(Some(primReg), Some(secReg), None, None)

    def this(primReg: Register, secReg: Register, multiplier: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, None)
    }

    def this(secReg: Register, multiplier: Int, offset: Int) = {
      this(None, Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None)
    }

    def this(primReg: Register, secReg: Register, multiplier: Int, offset: Int) = {
      this(Some(primReg), Some(secReg), if (multiplier != 1) Some(multiplier) else None, if (offset != 0) Some(OffsetInt(offset)) else None)
    }
  }

  object Memory {
    def apply(primReg: Register): Memory = new Memory(Some(primReg), None, None, None) {}

    def apply(primReg: Register, offset: Int): Memory = new Memory(Some(primReg), None, None, Some(OffsetInt(offset))) {}

    def apply(primReg: Register, label: Label): Memory = new Memory(Some(primReg), None, None, Some(OffsetLabel(label))) {}
  }

  // ADD instruction
  sealed abstract case class AddInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): AddInstr = {
      this.size = size
      this
    }
  }

  object AddInstr {
    def apply(src: Register, dst: Register): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Register, dst: Memory): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Memory, dst: Register): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Memory, dst: Immediate): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): AddInstr = new AddInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): AddInstr = new AddInstr(src, dst) {}
  }

  case class AndInstr(register: Register, register2: Register, size: Size) extends Instruction

  case class OrInstr(register: Register, register2: Register, size: Size) extends Instruction

  sealed abstract case class SubInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): SubInstr = {
      this.size = size
      this
    }
  }
  object SubInstr {
    def apply(src: Register, dst: Register): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Register, dst: Memory): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Memory, dst: Register): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Memory, dst: Immediate): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): SubInstr = new SubInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): SubInstr = new SubInstr(src, dst) {}
  }

  sealed abstract case class MulInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): MulInstr = {
      this.size = size
      this
    }
  }

  object MulInstr {
    def apply(src: Register, dst: Register): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Register, dst: Memory): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Memory, dst: Register): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Memory, dst: Immediate): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): MulInstr = new MulInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): MulInstr = new MulInstr(src, dst) {}
  }

  sealed abstract case class DivInstr(src: Register, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): DivInstr = {
      this.size = size
      this
    }
  }

  // Divide Instruction
  object DivInstr {
    def apply(src: Register, dst: Register): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Register, dst: Memory): DivInstr = new DivInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): DivInstr = new DivInstr(src, dst) {}
  }

  // Mod Instruction
  sealed abstract case class ModInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): ModInstr = {
      this.size = size
      this
    }
  }

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
  sealed abstract case class MovInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): MovInstr = {
      this.size = size
      this
    }
  }

  object MovInstr {
    def apply(src: Register, dst: Register): MovInstr = new MovInstr(src, dst) {}

    def apply(src: Register, dst: Memory): MovInstr = new MovInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): MovInstr = new MovInstr(src, dst) {}

    def apply(src: Memory, dst: Register): MovInstr = new MovInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): MovInstr = new MovInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): MovInstr = new MovInstr(src, dst) {}
  }

  // CMOV instruction
  sealed abstract case class CMovInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): CMovInstr = {
      this.size = size
      this
    }
  }

  object CMovInstr {
    def apply(src: Register, dst: Register): CMovInstr = new CMovInstr(src, dst) {}

    def apply(src: Register, dst: Memory): CMovInstr = new CMovInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): CMovInstr = new CMovInstr(src, dst) {}

    def apply(src: Memory, dst: Register): CMovInstr = new CMovInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): CMovInstr = new CMovInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): CMovInstr = new CMovInstr(src, dst) {}
  }

  sealed abstract case class CMovNeInstr(src: Operand, dst: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): CMovNeInstr = {
      this.size = size
      this
    }
  }

  object CMovNeInstr {
    def apply(src: Register, dst: Register): CMovNeInstr = new CMovNeInstr(src, dst) {}

    def apply(src: Register, dst: Memory): CMovNeInstr = new CMovNeInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): CMovNeInstr = new CMovNeInstr(src, dst) {}

    def apply(src: Memory, dst: Register): CMovNeInstr = new CMovNeInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): CMovNeInstr = new CMovNeInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): CMovNeInstr = new CMovNeInstr(src, dst) {}
  }

  case class CallInstr(label: Label) extends Instruction

  sealed abstract case class CmpInstr(src: Operand, value: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): CmpInstr = {
      this.size = size
      this
    }
  }

  object CmpInstr {
    def apply(src: Immediate, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}

    def apply(src: Memory, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}

    def apply(src: Register, dst: Register): CmpInstr = new CmpInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): CmpInstr = new CmpInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): CmpInstr = new CmpInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): CmpInstr = new CmpInstr(src, dst) {}
  }

  sealed abstract case class TestInstr(src: Operand, value: Operand, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): TestInstr = {
      this.size = size
      this
    }
  }

  object TestInstr {
    def apply(src: Immediate, dst: Immediate): TestInstr = new TestInstr(src, dst) {}

    def apply(src: Memory, dst: Memory): TestInstr = new TestInstr(src, dst) {}

    def apply(src: Register, dst: Register): TestInstr = new TestInstr(src, dst) {}

    def apply(src: Immediate, dst: Register): TestInstr = new TestInstr(src, dst) {}

    def apply(src: Register, dst: Immediate): TestInstr = new TestInstr(src, dst) {}

    def apply(src: Immediate, dst: Memory): TestInstr = new TestInstr(src, dst) {}
  }

  sealed abstract case class LeaInstr(src: Memory, value: Register, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): LeaInstr = {
      this.size = size
      this
    }
  }

  object LeaInstr {
    def apply(src: Memory, dst: Register): LeaInstr = new LeaInstr(src, dst) {}
  }

  case class JeInstr(label: Label) extends Instruction
  case class JneInstr(label: Label) extends Instruction

  case class JumpInstr(label: Label) extends Instruction

  case class NotInstr(register: Register) extends Instruction

  case class MoveGT(reg: Register, size: Size = BIT_64) extends Instruction

  case class MoveGTE(reg: Register, size: Size = BIT_64) extends Instruction

  case class MoveLT(reg: Register, size: Size = BIT_64) extends Instruction

  case class MoveLTE(reg: Register, size: Size = BIT_64) extends Instruction

  case class MoveEq(reg: Register, size: Size = BIT_64) extends Instruction

  case class MoveNEq(reg: Register, size: Size = BIT_64) extends Instruction

  case class Push(reg: Register, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): Push = {
      this.size = size
      this
    }
  }

  case class Pop(reg: Register, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): Pop = {
      this.size = size
      this
    }
  }

  case class Align(reg: Register, var size: Size = BIT_64) extends Instruction {
    def changeSize(size: Size): Align = {
      this.size = size
      this
    }
  }

  case class Ret() extends Instruction

  sealed trait Block

  class AsmBlock(var roData: Option[ReadOnlyData], val directive: Option[Directive], val label: Label, var instructions: ListBuffer[Instruction]) extends Block {
    def this(label: String, instructions: ListBuffer[Instruction]) = this(Option.empty, Option.empty, Label(label), instructions)

    def this(directive: String, label: String, instructions: ListBuffer[Instruction]) = this(Option.empty, Option(Directive(directive)), Label(label), instructions)

    def this(roData: ReadOnlyData, label: String, instructions: ListBuffer[Instruction]) = this(Option(roData), Option.empty, Label(label), instructions)

    def this(roData: ReadOnlyData, directive: String, label: String, instructions: ListBuffer[Instruction]) = this(Option(roData), Option(Directive(directive)), Label(label), instructions)

    def this(label: Label, instructions: ListBuffer[Instruction]) = this(Option.empty, Option.empty, label, instructions)

    def this(directive: String, label: Label, instructions: ListBuffer[Instruction]) = this(Option.empty, Option(Directive(directive)), label, instructions)

    def this(roData: ReadOnlyData, label: Label, instructions: ListBuffer[Instruction]) = this(Option(roData), Option.empty, label, instructions)

    def this(roData: ReadOnlyData, directive: String, label: Label, instructions: ListBuffer[Instruction]) = this(Option(roData), Option(Directive(directive)), label, instructions)

    def addROData(roData: ReadOnlyData) = {
      this.roData = Option(roData)
    }
  }

  case class ExitBlock() extends AsmBlock("_exit", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CallInstr(Label("exit@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))
  case class MoveSXInstr(memory: Memory, register: Register, memSize: Size, regSize: Size) extends Instruction

  case class ReadIntBlock() extends AsmBlock(new ReadOnlyData("readi", 2, "%d"), "text", "_readi", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    SubInstr(Immediate(16), StackPointer()),
    MovInstr(DestinationRegister(), Memory(StackPointer())).changeSize(BIT_32),
    LeaInstr(Memory(StackPointer()), SourceRegister()),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._readi_str0")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("scanf@plt")),
    MoveSXInstr(Memory(StackPointer()), ReturnRegister(), BIT_32, BIT_64),
    AddInstr(Immediate(16), StackPointer()),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))
  case class ReadCharBlock() extends AsmBlock(new ReadOnlyData("readc", 3, " %c"), "text", "_readc", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    SubInstr(Immediate(16), StackPointer()),
    MovInstr(DestinationRegister(), Memory(StackPointer())).changeSize(BIT_8),
    LeaInstr(Memory(StackPointer()), SourceRegister()),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._readc_str0")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("scanf@plt")),
    MoveSXInstr(Memory(StackPointer()), ReturnRegister(), BIT_8, BIT_64),
    AddInstr(Immediate(16), StackPointer()),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class StringPrintBlock() extends AsmBlock(new ReadOnlyData("prints", 4, "%.*s"), "text", "_prints", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(DestinationRegister(), DataRegister()),
    MovInstr(Memory(DestinationRegister(), -4), SourceRegister()).changeSize(BIT_32),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._prints_str0")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), DestinationRegister()),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class CharPrintBlock() extends AsmBlock(new ReadOnlyData("printc", 2, "%c"), "text", "_printc", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(DestinationRegister(), SourceRegister()).changeSize(BIT_8),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._printc_str0")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), DestinationRegister()),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  val boolROData = new ReadOnlyData("printb", ListBuffer((5, "false"), (4, "true"), (4, "%.*s")))

  case class BoolPrintBlock() extends AsmBlock(boolROData, "text", "_printb", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    CmpInstr(Immediate(0), DestinationRegister()).changeSize(BIT_8),
    JneInstr(Label(".L_printb0")),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._printb_str0")), DataRegister()),
    JumpInstr(Label(".L_printb1"))
  ))

  case class BoolPrintBlock0() extends AsmBlock("text", ".L_printb0", ListBuffer(
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._printb_str1")), DataRegister())
  ))

  case class BoolPrintBlock1() extends AsmBlock("text", ".L_printb1", ListBuffer(
    MovInstr(Memory(DataRegister(), -4), SourceRegister()).changeSize(BIT_32),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._printb_str2")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), DestinationRegister()),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class IntPrintBlock() extends AsmBlock(new ReadOnlyData("printi", 2, "%d"), "text", "_printi", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    MovInstr(DestinationRegister(), SourceRegister()).changeSize(BIT_32),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._printi_str0")), DestinationRegister()),
    MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
    CallInstr(Label("printf@plt")),
    MovInstr(Immediate(0), DestinationRegister()),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class PrintlnBlock() extends AsmBlock(new ReadOnlyData("println", 0, ""), "text", "_println", ListBuffer(
    Push(BasePointer()),
    MovInstr(StackPointer(), BasePointer()),
    Align(StackPointer()),
    LeaInstr(Memory(InstrPtrRegister(), Label(".L._println_str0")), DestinationRegister()),
    CallInstr(Label("puts@plt")),
    MovInstr(Immediate(0), DestinationRegister()),
    CallInstr(Label("fflush@plt")),
    MovInstr(BasePointer(), StackPointer()),
    Pop(BasePointer()),
    Ret()
  ))

  case class errBadChar() extends AsmBlock(new ReadOnlyData("errBadChar", 50, "fatal error: int %d is not ascii character 0-127 \\n"),
    "text", "_errBadChar", ListBuffer(
      Align(StackPointer()),
      LeaInstr(Memory(InstrPtrRegister(), Label(".L._errBadChar_str0")), DestinationRegister()),
      MovInstr(Immediate(0), ReturnRegister()).changeSize(BIT_8),
      CallInstr(Label("printf@plt")),
      MovInstr(Immediate(0), DestinationRegister()),
      CallInstr(Label("fflush@plt")),
      MovInstr(Immediate(-1), DestinationRegister()).changeSize(BIT_8),
      CallInstr(Label("exit@plt"))
  ))

  case class errDivZero() extends AsmBlock(new ReadOnlyData("errDivZero", 40, "fatal error: division or modulo by zero\\n"),
    "text", "_errDivZero", ListBuffer(
      Align(StackPointer()),
      LeaInstr(Memory(InstrPtrRegister(), Label(".L._errDivZero_str0")), DestinationRegister()),
      CallInstr(Label("_prints")),
      MovInstr(Immediate(-1), DestinationRegister()).changeSize(BIT_8),
      CallInstr(Label("exit@plt"))
    ))

  case class errOverflow() extends AsmBlock(new ReadOnlyData("errOverflow", 52, "fatal error: integer overflow or underflow occurred\\n"),
    "text", "_errOverflow", ListBuffer(
      Align(StackPointer()),
      LeaInstr(Memory(InstrPtrRegister(), Label(".L._errOverflow_str0")), DestinationRegister()),
      CallInstr(Label("_prints")),
      MovInstr(Immediate(-1), DestinationRegister()).changeSize(BIT_8),
      CallInstr(Label("exit@plt"))
    ))

    case class MallocBlock() extends AsmBlock("text", "_malloc", ListBuffer(
      Push(BasePointer()),
      MovInstr(StackPointer(), BasePointer()),
      Align(StackPointer()),
      CallInstr(Label("malloc@plt")),
      CmpInstr(Immediate(0), ReturnRegister()),
      JeInstr(Label("_errOutOfMemory")),
      MovInstr(BasePointer(), StackPointer()),
      Pop(BasePointer()),
      Ret()
    ))

  case class errOutOfMemory() extends AsmBlock(new ReadOnlyData("errOutOfMemory", 27, "fatal error: out of memory\\n"),
    "text", "_errOutOfMemory", ListBuffer(
      Align(StackPointer()),
      LeaInstr(Memory(InstrPtrRegister(), Label(".L._errOutOfMemory_str0")), DestinationRegister()),
      CallInstr(Label("_prints")),
      MovInstr(Immediate(-1), DestinationRegister()).changeSize(BIT_8),
      CallInstr(Label("exit@plt"))
    ))

  class ReadOnlyData(val labelName: String, val data: ListBuffer[(Int, String)]) extends Block {
    def this(readOnlyData: ReadOnlyData) = this(readOnlyData.labelName, readOnlyData.data)
    def this(labelName: String) = this(labelName, ListBuffer.empty: ListBuffer[(Int, String)])

    def this(labelName: String, n: Int, str: String) = this(labelName, ListBuffer((n, str)))

    def this(labelName: String, str: String) = this(labelName, ListBuffer((str.length, str)))

    def add(str: String): Unit = {
      if (!data.map(e => e._2).contains(str)) {
        data.addOne((str.length, formatStr(str)))
      }
    }

    def add(n: Int, str: String): Unit = data.addOne((n, formatStr(str)))

    private def formatStr(str: String): String = str.replace("\n", "\\n").replace("\b", "\\b").replace("\"", "\\\"")

    def prevString(): Label = Label(s".L.str${data.length - 1}")

    def get(n:Int): Label = Label(s".L.str${n}")
  }
}
