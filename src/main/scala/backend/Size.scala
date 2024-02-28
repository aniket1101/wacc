package backend

object Size extends Enumeration {
  type Size = Value

  val BIT_64 = Value(64)
  val BIT_32 = Value(32)
  val BIT_16 = Value(16)
  val BIT_8 = Value(8)
}