import Main._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import java.io.File

class UnitTests extends AnyFlatSpec {
  val fP_valid = "src/test/scala/unit_tests/valid"
  val fP_syntax_invalid = "src/test/scala/unit_tests/invalid_syntax"
  val fP_semantic_invalid = "src/test/scala/unit_tests/invalid_semantic"

  val fL_valid: List[(String, File)] = new ProcessExamples(fP_valid).processFolder()
  val fL_syntax_invalid: List[(String, File)] = new ProcessExamples(fP_syntax_invalid).processFolder()
  val fL_semantic_invalid: List[(String, File)] = new ProcessExamples(fP_semantic_invalid).processFolder()

  fL_valid.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe Left(VALID_EXIT_STATUS)
    }
  }

  fL_syntax_invalid.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe Left(SYNTAX_ERROR_EXIT_STATUS)
    }
  }

  fL_semantic_invalid.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe Left(SEMANTIC_ERROR_EXIT_STATUS)
    }
  }
}
