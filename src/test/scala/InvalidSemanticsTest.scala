import Main._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class InvalidSemanticsTest extends AnyFlatSpec {
  val folderPath = "src/test/scala/examples/invalidSemantics"

  val fileList: List[(String, String)] = new ProcessExamples(folderPath).processFolder()

  fileList.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe SEMANTIC_ERROR_EXIT_STATUS
    }
  }
}
