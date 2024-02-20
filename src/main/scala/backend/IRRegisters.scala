package backend
import IR._
object IRRegisters {

  // Calc Registers
  case class ReturnRegister() extends Register("rax")


  // Parameter Registers
  case class paramReg1() extends Register("rdi")
  case class paramReg2() extends Register("rsi")
  case class paramReg3() extends Register("rdx")
  case class paramReg4() extends Register("rcx")
  case class paramReg5() extends Register("r8")
  case class paramReg6() extends Register("r9")


  // Pointer Registers
  case class BasePointer() extends Register("rbp")
  case class StackPointer() extends Register("rsp")


  // Scrap Registers
  case class scrapReg1() extends Register("rbx")
  case class scrapReg2() extends Register("r12")
  case class scrapReg3() extends Register("r13")
  case class scrapReg4() extends Register("r14")
  case class scrapReg5() extends Register("r15")
}
