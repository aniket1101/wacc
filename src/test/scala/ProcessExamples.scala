import java.io.File

class ProcessExamples(val folderPath: String) {
  val fileExt = ".wacc"

  def processFolder(): List[(String, String)] = processFolderHelper(new File(folderPath))
  def processFolderHelper(folder: File): List[(String, String)] = {
    if (folder.isDirectory) {
      val files = folder.listFiles.toList
      files.flatMap { file =>
        if (file.isDirectory)
          processFolderHelper(file)
        else if (file.getName.endsWith(fileExt))
          List((generateTestName(file.getPath), readFileContents(file)))
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

  def readFileContents(file: File): String = {
    val source = scala.io.Source.fromFile(file)
    try {
      source.mkString
    } finally {
      source.close()
    }
  }
}
