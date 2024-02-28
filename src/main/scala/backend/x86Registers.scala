package backend
import backend.x86IR._

object x86Registers {
  // Accumulator
  case class RAX() extends x86Register("rax")
  case class EAX() extends x86Register("eax")
  case class  AX() extends x86Register("ax")
  case class  AL() extends x86Register("al")
  case class AccumulatorReg() extends x86Registers(RAX(), EAX(), AX(), AL())


  // Parameter Registers
  abstract class parameterReg(register: String) extends x86Register(register)

  case class RDI() extends parameterReg("rdi")
  case class EDI() extends parameterReg("edi")
  case class DI() extends parameterReg("di")
  case class DIL() extends parameterReg("dil")
  case class DestinationReg() extends x86Registers(RDI(), EDI(), DI(), DIL())

  case class RSI() extends parameterReg("rsi")
  case class ESI() extends parameterReg("edi")
  case class SI() extends parameterReg("di")
  case class SIL() extends parameterReg("dil")
  case class SourceReg() extends x86Registers(RSI(), ESI(), SI(), SIL())

  case class RDX() extends parameterReg("rdx")
  case class EDX() extends parameterReg("edx")
  case class DX() extends parameterReg("dx")
  case class DL() extends parameterReg("dl")
  case class DataReg() extends x86Registers(RDX(), EDX(), DX(), DL())

  case class RCX() extends parameterReg("rcx")
  case class ECX() extends parameterReg("ecx")
  case class CX() extends parameterReg("cx")
  case class CL() extends parameterReg("cl")
  case class CounterReg() extends x86Registers(RCX(), ECX(), CX(), CL())

  case class R8() extends parameterReg("r8")
  case class R8D() extends parameterReg("r8d")
  case class R8W() extends parameterReg("r8w")
  case class R8B() extends parameterReg("r8b")
  case class Reg8() extends x86Registers(R8(), R8D(), R8W(), R8B())

  case class R9() extends parameterReg("r9")
  case class R9D() extends parameterReg("r9d")
  case class R9W() extends parameterReg("r9w")
  case class R9B() extends parameterReg("r9b")
  case class Reg9() extends x86Registers(R9(), R9D(), R9W(), R9B())


  // Pointer Registers
  abstract class pointerReg(register: String) extends x86Register(register)

  case class RBP() extends pointerReg("rbp")
  case class EBP() extends pointerReg("ebp")
  case class BP() extends pointerReg("bp")
  case class BPL() extends pointerReg("bpl")
  case class BasePointer() extends x86Registers(RBP(), EBP(), BP(), BPL())

  case class RSP() extends pointerReg("rsp")
  case class ESP() extends pointerReg("esp")
  case class SP() extends pointerReg("sp")
  case class SPL() extends pointerReg("spl")
  case class StackPointer() extends x86Registers(RSP(), ESP(), SP(), SPL())

  // Scratch Registers
  abstract class scratchReg(register: String) extends x86Register(register)

  case class RBX() extends scratchReg("rbx")
  case class EBX() extends scratchReg("ebx")
  case class BX() extends scratchReg("bx")
  case class BL() extends scratchReg("bl")
  case class BaseReg() extends x86Registers(RBX(), EBX(), BX(), BL())

  case class R10() extends scratchReg("r10")
  case class R10D() extends scratchReg("r10d")
  case class R10W() extends scratchReg("r10w")
  case class R10B() extends scratchReg("r10b")
  case class Reg10() extends x86Registers(R10(), R10D(), R10W(), R10B())

  case class R11() extends scratchReg("r11")
  case class R11D() extends scratchReg("r11d")
  case class R11W() extends scratchReg("r11w")
  case class R11B() extends scratchReg("r11b")
  case class Reg11() extends x86Registers(R11(), R11D(), R11W(), R11B())


  // Variable Registers
  abstract class varReg(register: String) extends x86Register(register)

  case class R12() extends varReg("r12")
  case class R12D() extends varReg("r12d")
  case class R12W() extends varReg("r12w")
  case class R12B() extends varReg("r12b")
  case class Reg12() extends x86Registers(R12(), R12D(), R12W(), R12B())

  case class R13() extends varReg("r13")
  case class R13D() extends varReg("r13d")
  case class R13W() extends varReg("r13w")
  case class R13B() extends varReg("r13b")
  case class Reg13() extends x86Registers(R13(), R13D(), R13W(), R13B())

  case class R14() extends varReg("r14")
  case class R14D() extends varReg("r14d")
  case class R14W() extends varReg("r14w")
  case class R14B() extends varReg("r14b")
  case class Reg14() extends x86Registers(R14(), R14D(), R14W(), R14B())

  case class R15() extends varReg("r15")
  case class R15D() extends varReg("r15d")
  case class R15W() extends varReg("r15w")
  case class R15B() extends varReg("r15b")
  case class Reg15() extends x86Registers(R15(), R15D(), R15W(), R15B())
}