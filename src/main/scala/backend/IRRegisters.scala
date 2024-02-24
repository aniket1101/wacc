package backend
import IR._
object IRRegisters {

  // Return Register
  case class ReturnRegister() extends Register("rax")


  // Parameter Registers
  class paramReg(override val reg:String) extends Register(reg)


  // Pointer Registers
  case class BasePointer() extends Register("rbp")
  case class StackPointer() extends Register("rsp")


  // Variable Registers
  class varReg(override val reg:String) extends Register(reg)

  // Scratch Registers
  class scratchReg(override val reg:String) extends Register(reg)
}
