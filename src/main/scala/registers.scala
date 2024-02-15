object registers {
  final val ALL_REGS: List[Register] = List(R8, R9, R10, R11, R12, R13, R14, R15, RAX, RBX, RCX, RDX, RSI, RDI, RBP, RSP)

  sealed trait Register extends Ordered[Register] {
    def compare(that: Register): Int = ALL_REGS.indexOf(this) - ALL_REGS.indexOf(that)
    override def toString: String = this.getClass.getSimpleName.toLowerCase.init
  }

  // 64 bit registers
  object RAX extends Register
  object RBX extends Register
  object RCX extends Register
  object RDX extends Register
  object RSI extends Register
  object RDI extends Register
  object RBP extends Register
  object RSP extends Register
  object R8 extends Register
  object R9 extends Register
  object R10 extends Register
  object R11 extends Register
  object R12 extends Register
  object R13 extends Register
  object R14 extends Register
  object R15 extends Register

  // 32 bit registers
  object EAX extends Register
  object EBX extends Register
  object ECX extends Register
  object EDX extends Register
}
