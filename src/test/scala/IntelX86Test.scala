import Main._

import sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class IntelX86Test extends AnyFlatSpec {
  val src = "src/test/scala/intel_x86_examples"
  new ProcessExamples("src/test/scala/intel_x86_examples", ".s").processFolder()
    .foreach { case (testName, testCode) =>
      val outputName = removeFileExt(testCode.getPath)
      s"gcc -o $outputName $testCode".! match {
        case 0 => {
          // gcc compilation successful
          val correctExitCode = s"./$outputName".!
          val waccFile = "src/test/scala/examples/valid/" + removeFileExt(testCode.toString.substring(src.length + 1)) + ".wacc"
          main(Array(waccFile))
          val outputNameWacc = removeFileExt(waccFile)
          s"gcc -o $outputNameWacc $waccFile".! match {
            case 0 => {
              // gcc compilation successful
              val exitCode = s"./$outputNameWacc".!
              s"Compiler should compile: $testName" should "compile correctly" in {
                exitCode shouldBe correctExitCode
              }
            }
          }
        }
      }
    }
}
