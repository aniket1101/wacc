import main.Main._
import frontend.ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class FrontEndTests extends AnyFlatSpec {
  runAllTestTypes("src/test/scala/examples", ".wacc")
  runAllTestTypes("src/test/scala/examples/extraExamples", ".wacc")

  def runAllTestTypes(src: String, ext: String): Unit  = {
    new ProcessExamples(s"$src/valid", ext).processFolder()
      .foreach { case (testName, testCode) =>
        s"Parser should parse $testName" should "parse correctly" in {
          parseProgram(testCode) shouldBe Right(_: Prog)
        }
      }

    new ProcessExamples(s"$src/invalidSyntax", ext).processFolder()
      .foreach { case (testName, testCode) =>
        s"Parser should not parse: $testName" should "not parse correctly" in {
          parseProgram(testCode) match {
            case Left((err, _)) => err shouldBe SYNTAX_ERROR_EXIT_STATUS
          }
        }
      }

    new ProcessExamples(s"$src/invalidSemantics", ext).processFolder()
      .foreach { case (testName, testCode) =>
        s"Parser should not parse $testName" should "not parse correctly" in {
          parseProgram(testCode) match {
            case Left((err, _)) => err shouldBe SEMANTIC_ERROR_EXIT_STATUS
          }
        }
    }
  }
}
