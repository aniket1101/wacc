import Main._

import sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import java.io.File

class IntelX86Test extends AnyFlatSpec {
  def compileAndRunAsm(filename: String): Int = {
    val osName = System.getProperty("os.name").toLowerCase
    if (osName.contains("windows")) {
      // Windows device - Use WSL
      val linuxFilename = filename.replace("\\", "/")
      val output = removeFileExt(linuxFilename)
      s"wsl gcc -o $output $linuxFilename".! match {
        case 0 =>
          val returnVal = s"wsl ./$output".!
          // Delete produced file
          s"wsl rm $output".!
          returnVal
        case _ => -1
      }
    } else {
      val output = removeFileExt(filename)
      s"gcc -o $output $filename".! match {
        case 0 =>
          val returnVal = s"./$output".!
          // Delete produced file
          s"rm $output".!
          returnVal
        case _ => -1
      }
    }
  }

  val src = "src/test/scala/intel_x86_examples"
  new ProcessExamples("src/test/scala/intel_x86_examples", ".s").processFolder()
    .foreach { case (testName, testCode) =>
      val correctExitCode = compileAndRunAsm(testCode.getPath)

      val waccFile = "src/test/scala/examples/valid/" + removeFileExt(testCode.toString.substring(src.length + 1)) + ".wacc"
      val compilerOutput = compileProgram(waccFile)
      assert(compilerOutput <= 0, s"Error: $testName did not produce assembly")

      val outputFile = removeFileExt(new File(waccFile).getName) + ".s"
      val exitCode = compileAndRunAsm(outputFile)

      // Delete generated files
      deleteFile(outputFile)

      s"Compiler should compile: $testName" should s"return exit code $correctExitCode" in {
        exitCode shouldBe correctExitCode
      }
    }

  def deleteFile(filePath: String): Int = {
    val file = new File(filePath)
    if (file.exists()) {
      if (file.delete()) 1 else -1
    } else {
      -1
    }
  }
}
