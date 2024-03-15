import main.Main._
import frontend.ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class ExtensionTests extends AnyFlatSpec {
  val fileType = ".wacc"
  val src = "extensionExamples/"

  runTest("standardLib")

  def runTest(folder: String): Unit = {
    new ProcessExamples(src + folder, fileType).processFolder()
      .foreach { case (testName, testCode) =>
        s"Parser should parse $testName" should "parse correctly" in {
          parseProgram(testCode) shouldBe Right(_: Prog)
        }
      }
  }
}