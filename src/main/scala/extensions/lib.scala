package extensions

import backend.IR
import backend.IR._
import backend.IRRegisters._
import backend.Size.BIT_32
import frontend.ast._

object lib {
  val nullPos: (Int, Int) = (-1, -1)
  private val intType = IntType()(nullPos)
  private val intParam = Param(intType, new Ident("a")(nullPos))(nullPos)

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
      override val returnType: Type = intType

      override val blockInstr: List[Instruction] = List(
        MovInstr(DestinationRegister(), DataRegister()),
        CallInstr(Label("time@plt")),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -8)),
        MovInstr(Memory(BasePointer(), -8), ReturnRegister())
      )
    }

    private case class SleepFunc() extends LibFunc(timeLib) {
      override val funcName: String = "sleep"
      override val params: List[Param] = List(intParam)
      override val returnType: Type = intType
      override val blockInstr: List[Instruction] = List(
        MovInstr(DestinationRegister(), DataRegister()),
        CallInstr(Label("sleep@plt"))
      )
    }

    private case class YearFunc() extends LibFunc(timeLib) {
      override val funcName: String = "currentYear"
      override val params: List[Param] = List()
      override val returnType: Type = intType
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
      override val returnType: Type = intType
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

    private case class DayFunc() extends LibFunc(timeLib) {
      override val funcName: String = "currentDay"
      override val params: List[Param] = List()
      override val returnType: Type = intType
      override val blockInstr: List[Instruction] = List(
        MovInstr(Immediate(0), DestinationRegister()).changeSize(BIT_32),
        CallInstr(Label("time@PLT")),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -24)),
        LeaInstr(Memory(BasePointer(), -24), ReturnRegister()),
        MovInstr(ReturnRegister(), DestinationRegister()),
        CallInstr(Label("localtime@PLT")),
        MovInstr(ReturnRegister(), Memory(BasePointer(), -16)),
        MovInstr(Memory(BasePointer(), -16), ReturnRegister()),
        MovInstr(Memory(ReturnRegister(), 12), ReturnRegister()).changeSize(BIT_32)
      )
    }

    override val libFuncs: List[LibFunc] = List(TimeFunc(), SleepFunc(), YearFunc(), MonthFunc(), DayFunc())
  }

  private object randomLib extends Lib {
    override val libName: String = "random"

    case class RandIntFunc() extends LibFunc(randomLib) {
      override val funcName: String = "randint"
      override val params: List[Param] = List(intParam, intParam.updateIdent("b"))
      override val returnType: Type = intType
      override val blockInstr: List[Instruction] = List(
        SubInstr(Immediate(16), StackPointer()),
        MovInstr(DestinationRegister(), Memory(BasePointer(), -4)).changeSize(BIT_32),
        MovInstr(SourceRegister(), Memory(BasePointer(), -8)).changeSize(BIT_32),
        MovInstr(Immediate(0), DestinationRegister()).changeSize(BIT_32),
        CallInstr(Label("time@PLT")),
        MovInstr(ReturnRegister(), DestinationRegister()).changeSize(BIT_32),
        CallInstr(Label("srand@PLT")),
        CallInstr(Label("rand@PLT")),
        MovInstr(Memory(BasePointer(), -4), DestinationRegister()).changeSize(BIT_32),
        MovInstr(Memory(BasePointer(), -8), SourceRegister()).changeSize(BIT_32),
        AddInstr(Immediate(1), SourceRegister()),
        MovInstr(SourceRegister(), DataRegister()).changeSize(BIT_32),
        SubInstr(DestinationRegister(), DataRegister()).changeSize(BIT_32),
        LeaInstr(Memory(DataRegister()), new paramReg(2)).changeSize(BIT_32),
        DivInstr(new paramReg(2), new paramReg(2)).changeSize(BIT_32),
        MovInstr(DestinationRegister(), ReturnRegister()).changeSize(BIT_32),
        AddInstr(DataRegister(), ReturnRegister())
      )

    }

    override val libFuncs: List[LibFunc] = List(RandIntFunc())
  }

  private val libs: List[Lib] = List(timeLib, randomLib)

  def getLibs: Map[String, Lib] = {
    libs.map(l => (s"${l.libName}.wacc", l)).toMap
  }
}