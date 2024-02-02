import Main._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class ValidExamplesTest extends AnyFlatSpec {
  val folderPath = "src/test/scala/examples/valid"

  val fileList: List[(String, String)] = new ProcessExamples(folderPath).processFolder()

  fileList.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe VALID_EXIT_STATUS
    }
  }

}
