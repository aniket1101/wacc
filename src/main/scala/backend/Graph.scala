package backend

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import backend.x86IR.x86Label

class Graph {
  private val adjacencyList: mutable.HashMap[x86Label, mutable.ListBuffer[x86Label]] = mutable.HashMap()

  def addVertex(vertex: x86Label): Unit = {
    if (!adjacencyList.contains(vertex)) {
      adjacencyList(vertex) = mutable.ListBuffer[x86Label]()
    }
  }

  def addEdge(source: x86Label, destination: x86Label): Unit = {
    addVertex(source)
    addVertex(destination)
    val neighbors = adjacencyList(source)
    if (!neighbors.contains(destination)) {
      neighbors.append(destination)
    }
  }

  def getVertices(): Iterable[x86Label] = {
    adjacencyList.keys
  }

  def getNeighbors(vertex: x86Label): Iterable[x86Label] = {
    adjacencyList.getOrElse(vertex, mutable.ListBuffer())
  }

  def deleteLabel(labelToRemove: x86Label): Unit = {
    adjacencyList.remove(labelToRemove)
    adjacencyList.keys.foreach { sourceLabel =>
      adjacencyList(sourceLabel) = adjacencyList(sourceLabel).filterNot(_ == labelToRemove)
    }
  }


  def dfsUtil(start: x86Label, visited: Option[mutable.Set[x86Label]]): Option[mutable.Set[x86Label]] = {
    visited match {
      case Some(visitedSet) =>
        visitedSet.add(start)
        for (neighbor <- getNeighbors(start)) {
          if (!visitedSet.contains(neighbor)) {
            dfsUtil(neighbor, Some(visitedSet))
          }
        }
        Some(visitedSet)
      case None => None
    }
  }

  def dfs(start: x86Label): Option[mutable.Set[x86Label]] = {
    val visited = Some(mutable.Set[x86Label]())
    dfsUtil(start, visited)
  }

  def directlyLinkedLabels(): ListBuffer[(x86Label, x86Label)] = {
    val onlyLinkedLabels = mutable.ListBuffer[(x86Label, x86Label)]()

    adjacencyList.foreach { case (sourceLabel, destinations) =>
      destinations.foreach { destLabel =>
        val hasOtherLinks = adjacencyList.exists {
          case (otherSource, otherDests) =>
            otherSource != sourceLabel && otherDests.contains(destLabel)
        }

        if (!hasOtherLinks) {
          onlyLinkedLabels += ((sourceLabel, destLabel))
        }
      }
    }

    onlyLinkedLabels
  }

  def isolatedVertices(): List[x86Label] = {
    val allDests = adjacencyList.values.flatten.toSet
    val isolatedVertices = adjacencyList.keys.filterNot(allDests.contains).toList
    isolatedVertices
  }
}
