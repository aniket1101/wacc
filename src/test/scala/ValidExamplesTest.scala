import Main._
import ast._
import parser.parse
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import java.io.File

class ValidExamplesTest extends AnyFlatSpec {
  val folderPath = "src/test/scala/examples/valid"

  val fileList: List[(String, File)] = new ProcessExamples(folderPath).processFolder()

  fileList.foreach { case (testName, testCode) =>
    s"Parser should parse $testName" should "parse correctly" in {
      parseProgram(testCode) shouldBe Right(_: Prog)
    }
  }

}
