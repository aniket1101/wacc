package extensions.library

import frontend.ast.Prog

import java.io.File
import scala.collection.mutable

object dfs {
  def getTopologicalSorting(imports: mutable.Map[File, (Set[File], Prog)]): Map[File, (Set[File], Prog)] = {
    // Mutable map to store the order of traversal for each file
    val orderMap = mutable.LinkedHashMap.empty[File, Int]

    // Mutable set to keep track of visited files
    val visited = mutable.Set.empty[File]

    // Variable to keep track of the current order
    var order = 0

    // Depth-first search function
    def dfsVisit(file: File): Unit = {
      if (!visited.contains(file)) {
        visited.add(file)
        val (importsSet, _) = imports(file)
        importsSet.foreach(dfsVisit)
        orderMap.put(file, order)
        order += 1
      }
    }

    // Perform DFS for each file in the input map
    imports.keys.foreach(dfsVisit)

    // Sort the map based on the order of traversal
    val sortedMap = imports.toList.sortBy { case (file, _) => orderMap(file) }

    // Convert the sorted list back to a map
    sortedMap.toMap
  }
}
