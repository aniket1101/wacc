package extensions

import backend.IR._
import backend.IRRegisters._
import backend.Size.BIT_32
import frontend.ast._

object lib {
  val nullPos: (Int, Int) = (-1, -1)

  trait Lib {
    val libName: String
    val libFuncs: List[LibFunc]
    def getFuncs: List[Func] = {
      libFuncs.map(f => new Func(f.returnType, new Ident(f.funcName)(nullPos), f.params, List())(nullPos))
    }

    def getBlocks: Map[String, AsmBlock] = {
      libFuncs.map(f => (f.funcName, f.getBlock)).toMap
    }
  }

  abstract class LibFunc(library: Lib) {
    val funcName: String
    val params: List[Param]
    val returnType: Type
    val blockInstr: List[Instruction]

    def getBlock: AsmBlock = {
      new AsmBlock(s"wacc_${library.libName}.$funcName", List(
        Push(BasePointer()),
        MovInstr(StackPointer(), BasePointer()),
        Align(StackPointer())
      ).concat(blockInstr).concat(List(
        MovInstr(BasePointer(), StackPointer()),
        Pop(BasePointer()),
        Ret()
      )))
    }
  }

  private object timeLib extends Lib {
    override val libName = "time"

    private case class TimeFunc() extends LibFunc(timeLib) {
      override val funcName: String = "time"
      override val params: List[Param] = List()
      override val returnType: Type = IntType()(nullPos)

      override val blockInstr: List[Instruction] = List(
        MovInstr(DestinationRegister(), DataRegister()),
        CallInstr(Label("time@plt")),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -8)),
        MovInstr(Memory(BasePointer(), -8), ReturnRegister())
      )
    }

    private case class SleepFunc() extends LibFunc(timeLib) {
      override val funcName: String = "sleep"
      override val params: List[Param] = List(new Param(IntType()(nullPos), new Ident("dur")(nullPos))(nullPos))
      override val returnType: Type = IntType()(nullPos)
      override val blockInstr: List[Instruction] = List(
        MovInstr(DestinationRegister(), DataRegister()),
        CallInstr(Label("sleep@plt"))
      )
    }

    private case class YearFunc() extends LibFunc(timeLib) {
      override val funcName: String = "currentYear"
      override val params: List[Param] = List()
      override val returnType: Type = IntType()(null)
      override val blockInstr: List[Instruction] = List(
        CallInstr(Label("time@PLT")), 
        MovInstr(ReturnRegister(), Memory(BasePointer(), -88)), 
        LeaInstr(Memory(BasePointer(), -88), ReturnRegister()), 
        MovInstr(ReturnRegister(), DestinationRegister()), 
        CallInstr(Label("localtime@PLT")), 
        MovInstr(Memory(ReturnRegister()), new paramReg(2)), 
        MovInstr(Memory(ReturnRegister(), 8), BaseRegister()), 
        MovInstr(new paramReg(2), Memory(BasePointer(), -80)), 
        MovInstr(BaseRegister(), Memory(BasePointer(), -72)), 
        MovInstr(Memory(ReturnRegister(), 16), new paramReg(2)), 
        MovInstr(Memory(ReturnRegister(), 24), BaseRegister()), 
        MovInstr(new paramReg(2), Memory(BasePointer(), -64)), 
        MovInstr(BaseRegister(), Memory(BasePointer(), -56)), 
        MovInstr(Memory(ReturnRegister(), 32), new paramReg(2)), 
        MovInstr(Memory(ReturnRegister(), 40), BaseRegister()), 
        MovInstr(new paramReg(2), Memory(BasePointer(), -48)),
        MovInstr(BaseRegister(), Memory(BasePointer(), -40)), 
        MovInstr(Memory(ReturnRegister(), 48), ReturnRegister()), 
        MovInstr(ReturnRegister(), Memory(BasePointer(), -32)), 
        MovInstr(Memory(BasePointer(), -60), ReturnRegister()).changeSize(BIT_32),
        AddInstr(Immediate(1900), ReturnRegister()).changeSize(BIT_32),
      )
    }

    private case class MonthFunc() extends LibFunc(timeLib) {
      override val funcName: String = "currentMonth"
      override val params: List[Param] = List()
      override val returnType: Type = IntType()(null)
      override val blockInstr: List[Instruction] = List(
        CallInstr(Label("time@PLT")),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -88)),
        LeaInstr(Memory(BasePointer(), -88), ReturnRegister()),
        MovInstr(ReturnRegister(), DestinationRegister()),
        CallInstr(Label("localtime@PLT")),
        MovInstr(Memory(ReturnRegister()), new paramReg(2)),
        MovInstr(Memory(ReturnRegister(), 8), BaseRegister()),
        MovInstr(new paramReg(2), Memory(BasePointer(), -80)),
        MovInstr(BaseRegister(), Memory(BasePointer(), -72)),
        MovInstr(Memory(ReturnRegister(), 16), new paramReg(2)),
        MovInstr(Memory(ReturnRegister(), 24), BaseRegister()),
        MovInstr(new paramReg(2), Memory(BasePointer(), -64)),
        MovInstr(BaseRegister(), Memory(BasePointer(), -56)),
        MovInstr(Memory(ReturnRegister(), 32), new paramReg(2)),
        MovInstr(Memory(ReturnRegister(), 40), BaseRegister()),
        MovInstr(new paramReg(2), Memory(BasePointer(), -48)),
        MovInstr(BaseRegister(), Memory(BasePointer(), -40)),
        MovInstr(Memory(ReturnRegister(), 48), ReturnRegister()),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -32)),
        MovInstr(Memory(BasePointer(), -64), ReturnRegister()).changeSize(BIT_32),
        AddInstr(Immediate(1), ReturnRegister()).changeSize(BIT_32),
      )
    }

    override val libFuncs: List[LibFunc] = List(TimeFunc(), SleepFunc(), YearFunc(), MonthFunc())
  }

  private val libs: List[Lib] = List(timeLib)

  def getLibs: Map[String, Lib] = {
    libs.map(l => (s"${l.libName}.wacc", l)).toMap
  }
}