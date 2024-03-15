package backend
import IR._
object IRRegisters {

  // Return Register
  case class ReturnRegister() extends Register()


  // Parameter Registers
  class paramReg(val no: Int) extends Register()

  // Instruction Pointer Register
  case class InstrPtrRegister() extends Register()

  // Instruction Pointer Register
  case class SourceRegister() extends Register()

  // Instruction Pointer Register
  case class DestinationRegister() extends Register()

  // Data Pointer Register
  case class DataRegister() extends Register()

  // Base Register
  case class BaseRegister() extends Register()

  // Pointer Registers
  case class BasePointer() extends Register()
  case class StackPointer() extends Register()


  // Variable Registers
  class varReg(val no: Int) extends Register()

  // Scratch Registers
  class scratchReg(val no: Int, val scope: Int) extends Register() {
    override def equals(obj: Any): Boolean = {
      obj match {
        case s:scratchReg => s.no == this.no
        case _ => false
      }
    }
  }
}
