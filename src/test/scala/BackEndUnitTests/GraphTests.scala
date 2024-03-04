package BackEndUnitTests

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._
import extensions.Graph

import scala.collection.mutable.ListBuffer
class GraphTests extends AnyFlatSpec {

  "GraphNodeTest" should "contain added nodes" in {
    val testGraph = new Graph()
    testGraph.addVertex("math")
    testGraph.addVertex("utility")
    testGraph.getVertices shouldBe Set("math", "utility")
  }

  "GraphNodeTest2" should "not contain duplicate nodes" in {
    val testGraph = new Graph()
    testGraph.addVertex("math")
    testGraph.addVertex("utility")
    testGraph.addVertex("math")
    testGraph.getVertices shouldBe Set("math", "utility")
  }

  "GraphEdgeTest1" should "contain added edge" in {
    val testGraph = new Graph()
    testGraph.addEdge("math", "utility")
    testGraph.getNeighbors("math") shouldBe ListBuffer("utility")
  }

  "GraphEdgeTest2" should "contain many added edges" in {
    val testGraph = new Graph()
    testGraph.addEdge("math", "utility")
    testGraph.addEdge("math", "test1")
    testGraph.addEdge("math", "test2")
    testGraph.addEdge("math", "test3")
    testGraph.getNeighbors("math") shouldBe ListBuffer("utility", "test1", "test2", "test3")
  }

  "GraphDFSTest1" should "return vertices" in {
    val testGraph = new Graph()
    testGraph.addEdge("math", "utility")
    val res = testGraph.dfs("math").getOrElse(-1)
    res shouldBe Set("math", "utility")
  }

  "GraphDFSTest2" should "return none for duplicates" in {
    val testGraph = new Graph()
    testGraph.addEdge("math", "utility")
    testGraph.addEdge("utility", "math")
    val res = testGraph.dfs("math").getOrElse(-1)
    res shouldBe -1
  }
}
