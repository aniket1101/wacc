import java.io.File
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class ExamplesTest extends AnyFlatSpec {
  val folderPath = "src/test/scala/examples/valid"
  val fileList = processFolder(new File(folderPath))

  fileList.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parser.parse(testCode) shouldBe a[Right[_, _]]
    }
  }

  def main(): Unit = {
    val folderPath = "src/test/scala/examples/valid"
    val fileList = processFolder(new File(folderPath))
    fileList.foreach({ case (testName, testCode) =>
      "Parser" should testName in {
        parser.parse(testCode) shouldBe a[Right[_, _]]
      }
    })
  }
  def processFolder(folder: File): List[(String, String)] = {
    if (folder.isDirectory) {
      val files = folder.listFiles.toList
      files.flatMap { file =>
        if (file.isDirectory)
          processFolder(file)
        else if (file.getName.endsWith(".wacc"))
          List((file.getPath.replaceAll("src/test/scala/examples/valid/", "").replaceAll(".wacc", ""), readFileContents(file)))
        else
          List.empty
      }
    } else {
      List.empty
    }
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
