import Main.parseProgram
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class InvalidSemanticsTest extends AnyFlatSpec {
  val folderPath = "src/test/scala/examples/invalidSemantics"

  val fileList: List[(String, String)] = new ProcessExamples(folderPath).processFolder()

  fileList.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      // TODO Change this to error code 200
      parseProgram(testCode) shouldBe 0
    }
  }
}
