package extensions

import backend.IR._
import backend.IRRegisters._
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

    override val libFuncs: List[LibFunc] = List(TimeFunc(), SleepFunc())
  }

  private val libs: List[Lib] = List(timeLib)

  def getLibs: Map[String, Lib] = {
    libs.map(l => (s"${l.libName}.wacc", l)).toMap
  }
}