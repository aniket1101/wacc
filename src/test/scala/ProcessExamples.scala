import java.io.File

class ProcessExamples(val folderPath: String, val fileExt: String) {

  def processFolder(): List[(String, File)] = processFolderHelper(new File(folderPath))
  def processFolderHelper(folder: File): List[(String, File)] = {
    if (folder.isDirectory) {
      val files = folder.listFiles.toList
      files.flatMap { file =>
        if (file.isDirectory)
          processFolderHelper(file)
        else if (file.getName.endsWith(fileExt))
          List((generateTestName(file.getPath), file))
        else
          List.empty
      }
    } else {
      List.empty
    }
  }

  def generateTestName(path: String): String = {
    val parts = path.split("[/\\\\]")
    val lastFolder = parts.init.lastOption.getOrElse("").capitalize
    val fileName = parts.lastOption.getOrElse("").replaceFirst(fileExt, "")
    s"$lastFolder($fileName)"
  }

}
