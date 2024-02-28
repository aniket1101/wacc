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
          val outputBuffer = new StringBuilder
          val processLogger = ProcessLogger((output: String) => outputBuffer.append(output).append("\n"))
          val exitCode = s"wsl ./$output".run(processLogger).exitValue()
          val outputString = outputBuffer.toString()
          s"wsl rm $output".!
          new ExecOutput(exitCode, outputString)
        case _ => new ExecOutput(-1, "")
      }
    } else {
      val output = removeFileExt(filename).replace("-", "")
      s"gcc -o '$output' '$filename'".! match {
        case 0 =>
          val outputBuffer = new StringBuilder
          val processLogger = ProcessLogger((output: String) => outputBuffer.append(output))
          val exitCode = s"timeout 2s ./$output".run(processLogger).exitValue()
          val outputString = outputBuffer.toString()
          s"rm $output".!
          new ExecOutput(exitCode, outputString)
        case _ => new ExecOutput(-1, "")
      }
    }
  }

  val src = "src/test/scala/intelX86Examples"
  new ProcessExamples(src, ".s").processFolder()
    .foreach { case (testName, testCode) =>
      val correctOutput = compileAndRunAsm(testCode.getPath)

      val waccFile = "src/test/scala/examples/valid/" + removeFileExt(testCode.toString.substring(src.length + 1)) + ".wacc"
      val output = try {
        val compilerOutput = compileProgram(waccFile)
        assert(compilerOutput <= 0, s"Error: $testName did not produce assembly")
        val outputFile = removeFileExt(new File(waccFile).getName) + ".s"
        val output = compileAndRunAsm(outputFile)

        // Delete generated files
        deleteFile(outputFile)
        output

      } catch {
        case e: Exception => println(s"Error compiling $testName")
          new ExecOutput(-2, "")
      }

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

  def readFileToString(file: String): String = {
    val source = Source.fromFile(file)
    try {
      source.mkString
    } finally {
      source.close()
    }
  }
}
