package backend

import scala.collection.mutable
import scala.collection.mutable.ListBuffer

import backend.Size._
import backend.IR._
import backend.IRRegisters._
import backend.x86IR.InstrSize._
import backend.x86IR._
import backend.x86Registers._

class ControlFlowBlocks(x86blocks: List[x86IR.x86Block]) {

    def CFProgram(): List[x86IR.x86Block] = {

        val mainLabel = new x86Label("main")

        val blockGraph = new Graph()

        val edgeJumps = mutable.Map[(x86IR.x86Label, x86IR.x86Label), ListBuffer[String]]()

        for (block <- x86blocks) {
            blockGraph.addVertex(block.label)

            for (instr <- block.instructions) {
                var isJump = true
                val (labelToJump, jmpType) : (x86Label, String) = 
                    instr match {
                        case Je(label: x86Label) => (label, "Je")

                        case Jge(label: x86Label) => (label, "Jge")

                        case Jl(label: x86Label) => (label, "Jl")

                        case Jle(label: x86Label) => (label, "Jle")

                        case Jne(label: x86Label) => (label, "Jne")

                        case Jo() => (new x86Label("_errOverflow"), "Jo")

                        case Jump(label: x86Label) => (label, "Jump")

                        case Call(label: x86Label) => (label, "Call")
                        case _ =>  {
                            isJump = false
                            (new x86Label(""), "")
                        }
                    }
                if (isJump) {
                    blockGraph.addEdge(block.label, labelToJump)
                    val edge = (block.label, labelToJump)
                    if (!edgeJumps.contains(edge)) {
                        edgeJumps(edge) = ListBuffer(jmpType)
                    } else {
                        edgeJumps(edge) += jmpType
                    }
                }
            }
        }

        val reachFromMain = blockGraph.dfs(mainLabel).getOrElse(Set.empty[x86Label])

        val unusedLabels = blockGraph.getVertices()
            .filter(label => !reachFromMain.contains(label) 
                    && !label.equals(mainLabel)
                    && !label.name.startsWith("_") // to account for @plt functions
            )

        for (labelToDelete <- unusedLabels) {
            blockGraph.deleteLabel(labelToDelete)
        }

        val directlyLinkedLabels: ListBuffer[(x86Label, x86Label)] = 
            blockGraph.directlyLinkedLabels().filterNot { case (_, dest) => dest.equals(mainLabel) }

        var blocks = x86blocks.filterNot(block => unusedLabels.toList.contains(block.label))

        /**edgeJumps.foreach {
            case edge@((src, dst), jumps) if directlyLinkedLabels.contains((src, dst)) 
                && jumps.size == 1 
                && jumps.head == "Jump" =>
                (blocksMap.get(src), blocksMap.get(dst)) match {
                    case (Some(sourceBlock), Some(destBlock)) =>
                        val jumpIndex = sourceBlock.instructions.indexWhere {
                            case Jump(label) if label == dst => true
                            case _ => false
                        }

                        if (jumpIndex != -1) {
                            val updatedInstructions = sourceBlock.instructions.take(jumpIndex) ++
                                                        destBlock.instructions ++ 
                                                        sourceBlock.instructions.drop(jumpIndex + 1)
                            sourceBlock.instructions = updatedInstructions
                        }
                    case _ => 
                }
            case _ => 
        }
        val updatedBlocks = blocksMap.values.toList
        updatedBlocks
        **/
        blocks

    }    
}