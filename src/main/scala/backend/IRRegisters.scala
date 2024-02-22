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
  case class BasePointer() extends Register("rsp")
  case class StackPointer() extends Register("rbp")


  // Scratch Registers
  case class scratchReg1() extends Register("rbx")
  case class scratchReg2() extends Register("r12")
  case class scratchReg3() extends Register("r13")
  case class scratchReg4() extends Register("r14")
  case class scratchReg5() extends Register("r15")
}
