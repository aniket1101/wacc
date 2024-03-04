package extensions

import scala.collection.mutable

case class Edge(string: String)

class Graph {
    private val adjacencyList: mutable.HashMap[String, mutable.ListBuffer[String]] = mutable.HashMap()

    def addVertex(vertex: String): Unit = {
      if (!adjacencyList.contains(vertex)) {
        adjacencyList(vertex) = mutable.ListBuffer[String]()
      }
    }

  def addEdge(source: String, destination: String): Unit = {
    addVertex(source)
    addVertex(destination)
    val neighbors = adjacencyList(source)
    if (!neighbors.contains(destination)) {
      neighbors.append(destination)
    }
  }

    def getVertices: Iterable[String] = {
      adjacencyList.keys
    }

    def getNeighbors(vertex: String): Iterable[String] = {
      adjacencyList.getOrElse(vertex, mutable.ListBuffer())
    }

    override def toString: String = {
      val str = new StringBuilder()
      for ((vertex, neighbors) <- adjacencyList) {
        str.append(s"$vertex -> ${neighbors.mkString(", ")}\n")
      }
      str.toString()
  }

  def dfsUtil(start: String, visited: Option[mutable.Set[String]]): Option[mutable.Set[String]] = {
    visited match {
      case Some(visitedSet) =>
        visitedSet.add(start)
        for (neighbor <- getNeighbors(start)) {
          if (visitedSet.contains(neighbor)) {
            return None
          }
          dfsUtil(neighbor, Some(visitedSet)) match {
            case None => return None
            case _ =>
          }
        }
        Some(visitedSet)
      case None => None
    }
  }

  def dfs(start: String): Option[mutable.Set[String]] = {
    val visited = Some(mutable.Set[String]())
    dfsUtil(start, visited)
  }


}
