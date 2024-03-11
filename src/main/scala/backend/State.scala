package backend

import backend.IR.{Block, Register}

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

sealed class State(inFunc:Boolean, curBlock:Block, paramCount:Int, paramRegs:ListBuffer[Register], usedRegs:Int, variableMap:mutable.Map[String, Register], scratchCounter:Int, varRegs:ListBuffer[Register], varCounter:Int) {

}

object State {
  def apply(inFunc:Boolean, curBlock:Block): State = {
    new State(inFunc, curBlock, 0, ListBuffer.empty, 0, mutable.Map.empty, 0, ListBuffer.empty, 0)
  }
}
