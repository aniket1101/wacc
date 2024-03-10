package backend

object Size extends Enumeration {
  type Size = Value

  val BIT_64 = Value(64)
  val BIT_32 = Value(32)
  val BIT_16 = Value(16)
  val BIT_8 = Value(8)

  def getWordType(typSize: Int):Size = {
    val wordType = typSize match {
      case 8 => BIT_64
      case 4 => BIT_32
      case 2 => BIT_16
      case 1 => BIT_8
    }
    wordType
  }
}