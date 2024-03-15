package backend

sealed class x86State(var regCounter:Int, var hasOffset:Boolean, var offset:Int) {

  def getCounter(): Int = {
    this.regCounter
  }

  def incrementCounter(): Unit = {
    this.regCounter += 1
  }

  def setHasOffset(): Unit = {
    this.hasOffset = true
  }

  def getHasOffset(): Boolean = {
    hasOffset
  }

  def setOffset(off:Int): Unit = {
    this.offset = off
  }

  def getOffset(): Int = {
    offset
  }

}

object x86State {
  def apply(regCounter: Int): x86State = {
    new x86State(regCounter, false, 0) {}
  }
}
