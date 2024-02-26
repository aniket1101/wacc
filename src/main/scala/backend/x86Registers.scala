package backend
import backend.x86IR._

object x86Registers {

  // Calc Registers
  case class RAX() extends x86Register("rax")

  // Parameter Registers
  case class RDI() extends x86Register("rdi")
  case class RSI() extends x86Register("rsi")
  case class RDX() extends x86Register("rdx")
  case class RCX() extends x86Register("rcx")
  case class R8() extends x86Register("r8")
  case class R9() extends x86Register("r9")

  // Pointer Registers
  case class RBP() extends x86Register("rbp")
  case class RSP() extends x86Register("rsp")

  // Scratch Registers
  class RBX() extends x86Register("rbx")

  // Variable Registers
  case class R12() extends x86Register("r12")
  case class R13() extends x86Register("r13")
  case class R14() extends x86Register("r14")
  case class R15() extends x86Register("r15")
}