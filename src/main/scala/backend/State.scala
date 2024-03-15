

package backend

import backend.IR.{AsmBlock, Block, Instruction, Pop, Register}
import backend.IRRegisters.{paramReg, scratchReg}

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

sealed class State(inFunc:Boolean, var curBlock:AsmBlock, var paramCount:Int, var usedRegs:Int, variableMap:mutable.Map[String, Register], var scratchCounter:Int, varRegs:ListBuffer[Register], var varCounter:Int, scopePrefix:String) {
  def getVarMap(): mutable.Map[String, Register] = {
    variableMap
  }

  def getFromVarMap(x:String): Register = {
    variableMap(x)
  }

  def getScopePrefix(): String = {
    scopePrefix
  }

  def getParamCount(): Int = {
    paramCount
  }

  def getVarCounter(): Int = {
    varCounter
  }

  def getScratchCounter(): Int = {
    scratchCounter
  }

  def setScratchCounter(counter:Int): Unit = {
    scratchCounter = counter
  }

  def incrementScratchCounter(): Unit = {
    scratchCounter += 1
  }

  def incrementVarCounter(): Unit = {
    varCounter += 1
  }

  def incrementParamCounter(): Unit = {
    paramCount += 1
  }

  def decrementParamCounter(): Unit = {
    paramCount -= 1
  }

  def getUsedRegs(): Int = {
    usedRegs
  }

  def getVarRegs(): ListBuffer[Register] = {
    varRegs
  }

  def getCurBlock(): AsmBlock = {
    curBlock
  }

  def getInFunc(): Boolean = {
    inFunc
  }

  def addToVarRegs(reg:Register): Unit = {
    varRegs += reg
  }

  def setUsedRegs(regs:Int): Unit = {
    this.usedRegs = regs
  }

  def setParamCount(count:Int): Unit = {
    this.paramCount = count
  }
}

object State {
  def apply(inFunc:Boolean, curBlock:AsmBlock, variableMap:mutable.Map[String, Register], scopePrefix:String): State = {
    new State(inFunc, curBlock, 0, 0, mutable.Map.empty, 0, ListBuffer.empty, 0, scopePrefix) {}
  }
}

