import Main._

import sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import java.io.File
import scala.io.Source

class IntelX86Test extends AnyFlatSpec {
  val DEBUG_MODE: Boolean = false
  class ExecOutput(val exitCode: Int, val output: String)
  def compileAndRunAsm(filename: String, inputs: List[String]): ExecOutput = {
    val osName = System.getProperty("os.name").toLowerCase

    val inputCmd = if (inputs.isEmpty) "" else {
      s"""echo '${inputs.mkString(" ")}' | """
    }

    if (osName.contains("windows")) {
      // Windows device - Use WSL
      val linuxFilename = filename.replace("\\", "/")
      val output = removeFileExt(linuxFilename)
      s"wsl gcc -o $output $linuxFilename".! match {
        case 0 =>
          val outputBuffer = new StringBuilder
          val processLogger = ProcessLogger((output: String) => outputBuffer.append(output).append("\n"))
          val exitCode = s"""wsl sh -c "timeout 2s $inputCmd./$output"""".run(processLogger).exitValue()
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
          val exitCode = s"timeout 2s $inputCmd./$output".run(processLogger).exitValue()
          val outputString = outputBuffer.toString()
          val parts = outputString.split("\\|")
          val result: String = parts.headOption.map(_.trim).getOrElse("")
          s"rm $output".!
          new ExecOutput(exitCode, result)
        case _ => new ExecOutput(-1, "")
      }
    }
  }

  def compileAndRunWacc(waccFile: String, testName: String, inputs: List[String], delete: Boolean): ExecOutput = {
    val compilerOutput = compileProgram(waccFile)
    assert(compilerOutput <= 0, s"Error: $testName did not produce assembly")
    val outputFile = removeFileExt(new File(waccFile).getName) + ".s"
    val output = compileAndRunAsm(outputFile, inputs)

    // Delete generated files
    if (delete)
      deleteFile(outputFile)
    output
  }

  val src = "src/test/scala/intelX86Examples"

//  val src = "src/test/scala/allIntelX86Compiled"

  new ProcessExamples(src, ".s").processFolder()
    .foreach { case (testName, testCode) =>
      val waccFile = "src/test/scala/examples/valid/" + removeFileExt(testCode.toString.substring(src.length + 1)) + ".wacc"
      val inputs: List[String] = findWaccInputs(waccFile)
      val correctOutput = compileAndRunAsm(testCode.getPath, inputs)
      val output = if (DEBUG_MODE) {
        compileAndRunWacc(waccFile, testName, inputs, delete = false)
      } else {
        try {
          compileAndRunWacc(waccFile, testName, inputs, delete = true)
        } catch {
          case e: Exception => println(s"Error compiling $testName")
            new ExecOutput(-2, "")
        }
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

  def findWaccInputs(waccFile: String): List[String] = {
    val waccCode = readFileToString(waccFile)
    val inputLine = waccCode.split("\n").map(_.toUpperCase).find(_.contains("INPUT:"))
    val inputs = inputLine.map(_.split("\\s+").drop(2).toList).getOrElse(List.empty)
    inputs
  }
}