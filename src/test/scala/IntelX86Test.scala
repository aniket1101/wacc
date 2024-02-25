import Main._

import sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import java.io.File
import scala.io.Source

class IntelX86Test extends AnyFlatSpec {
  class ExecOutput(val exitCode: Int, val output: String)
  def compileAndRunAsm(filename: String): ExecOutput = {
    val osName = System.getProperty("os.name").toLowerCase
    if (osName.contains("windows")) {
      // Windows device - Use WSL
      val linuxFilename = filename.replace("\\", "/")
      val output = removeFileExt(linuxFilename)
      s"wsl gcc -o $output $linuxFilename".! match {
        case 0 =>
          val returnVal = s"wsl ./$output > output.txt".!
          // Delete produced file
          s"wsl rm $output".!
          new ExecOutput(returnVal, readFileToString(new File("output.txt")))
        case _ => new ExecOutput(-1, "")
      }
    } else {
      val output = removeFileExt(filename)
      s"gcc -o $output $filename".! match {
        case 0 =>
          val returnVal = s"./$output > output".!
          // Delete produced file
          s"rm $output".!
          new ExecOutput(returnVal, readFileToString(new File("output")))
        case _ => new ExecOutput(-1, "")
      }
    }
  }

  val src = "src/test/scala/intelX86Examples"
  new ProcessExamples(src, ".s").processFolder()
    .foreach { case (testName, testCode) =>
      val correctOutput = compileAndRunAsm(testCode.getPath)

      val waccFile = "src/test/scala/examples/valid/" + removeFileExt(testCode.toString.substring(src.length + 1)) + ".wacc"
      val compilerOutput = compileProgram(waccFile)
      assert(compilerOutput <= 0, s"Error: $testName did not produce assembly")

      val outputFile = removeFileExt(new File(waccFile).getName) + ".s"
      val output = compileAndRunAsm(outputFile)

      // Delete generated files
      deleteFile(outputFile)
      deleteFile("output.txt")

      s"Compiler should compile: $testName" should s"return exit code ${correctOutput.exitCode}" in {
        output.exitCode shouldBe correctOutput.exitCode
        output.output shouldBe correctOutput.output
      }
    }

  def deleteFile(filePath: String): Int = {
    val file = new File(filePath)
    if (file.exists()) {
      if (file.delete()) 0 else -1
    } else {
      -1
    }
  }

  def readFileToString(file: File): String = {
    val source = Source.fromFile(file)
    try {
      source.mkString
    } finally {
      source.close()
    }
  }
}
