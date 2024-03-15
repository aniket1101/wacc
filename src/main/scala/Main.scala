package main

import backend._
import extensions.library.dfs.getTopologicalSorting
import extensions.library.lib
import frontend.ast._
import frontend.parser._
import frontend.validator.{checkSemantics, fileExists}
import frontend.waccErrors.WaccError

import java.io.{File, PrintWriter}
import scala.collection.mutable
import scala.concurrent.Await
import scala.concurrent.duration._
import scala.sys.exit
import scala.util.{Failure, Success}

// Object representing the main entry point of the program
object Main {
  // Define exit status codes
  val VALID_EXIT_STATUS: Int = 0
  val SYNTAX_ERROR_EXIT_STATUS: Int = 100
  val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
  val CONCURRENT_COMPILATION: Boolean = false
  val FAIL: Int = -1
  val CONTROL_FLOW_OPTIMISATION: Boolean = true
  private val nullPos: (Int, Int) = (-1, -1)

  // Main function of the program
  def main(args: Array[String]): Unit = {
    args.headOption match {
      case Some(filePath) =>
        exit(compileProgram(filePath))
      case None =>
        System.out.println("Source file unspecified")
        exit(FAIL)
    }
  }

  def compileProgram(source: String): Int = {
    val mainFile = new File(source)
    parseProgram(mainFile) match {
      case Right((prog, symTable)) =>
        // Compile program
        val asmCode = generateAsm(prog, symTable)
        writeToFile(asmCode, removeFileExt(mainFile.getName) + ".s") match {
          case VALID_EXIT_STATUS => VALID_EXIT_STATUS
          case err =>
            println("Failed to write to output file")
            err
        }
      case Left((err, _)) => err
    }
  }

  def parseProgram(mainFile: File): Either[(Int, Option[WaccError]), (Prog, mutable.Map[String, Type])] = {
    // Combines multiple wacc programs into a map of file to its ast
    parseImports(mainFile) match {
      case Right(importGraph) =>
        var outputFunc: List[Func] = List()

        // Combine other ASTs
        getTopologicalSorting(importGraph).foreach { case (filename, (_, prog)) =>
          val renamedFuncs = if (filename == mainFile) {
            prog.funcs
          } else {
            prog.funcs.map(_.addLibraryPrefix(removeFileExt(filename.getName)))
          }
          outputFunc = outputFunc.concat(renamedFuncs)
        }

        // Perform semantic check
        val combinedProg = new Prog(Option.empty, outputFunc, importGraph(mainFile)._2.stats)(nullPos)
        checkSemantics(combinedProg, mainFile.toString) match {
          // If there are no semantic errors
          case (errors, outputProg, symbolTable) =>
            if (errors.isEmpty) {
              Right((outputProg, symbolTable))
            } else {
              // Print semantic errors and exit with semantic error status
              println(errors.map(err => err.display).mkString("\n"))
              Left((SEMANTIC_ERROR_EXIT_STATUS, Option(errors.head)))
            }
        }

      case Left(exitCode) => Left(exitCode)
    }
  }

  private def parseProgramToAST(source: File): Either[(Int, Option[WaccError]), Prog] = {
    val filepath = if (lib.getLibs.contains(source.getName)) {
      return Right(new Prog(Option.empty, lib.getLibs(source.getName).getFuncs, List())(nullPos))
    } else if (!fileExists(source.getPath)) {
      new File("src/lib", source.getPath)
    } else {
      source
    }

    if (!filepath.exists()) {
      println(s"Import Error: File '${filepath.getPath}' does not exist.")
      return Left((FAIL, Option.empty))
    }

    val result = parse(filepath)
    result match {
      // If parsing is successful
      case Success(value) =>
        value match {
          // If parsing is successful according to the Parsley parser
          case parsley.Success(newValue) =>
            Right(newValue)
          // If parsing fails according to the Parsley parser
          case parsley.Failure(err) =>
            // Print syntax error and exit with syntax error status
            println(err.display)
            Left((SYNTAX_ERROR_EXIT_STATUS, Option(err)))
        }
      // If parsing fails
      case Failure(err) =>
        // Print parsing failure error and exit with general failure status
        println(err)
        Left((FAIL, Option.empty))
    }
  }

  def parseImports(initialFile: File): Either[(Int, Option[WaccError]), mutable.Map[File, (Set[File], Prog)]] = {
    val importGraph = mutable.Map[File, (Set[File], Prog)]()
    val visited = mutable.Set[File]()
    var exitCode = VALID_EXIT_STATUS
    var error: Option[WaccError] = Option.empty

    def processFile(file: File): Unit = {
      if (!visited.contains(file)) {
        parseProgramToAST(file) match {
          case Right(prog) =>
            visited.add(file)
            val imports = extractFiles(prog.imports)
            importGraph(file) = (imports, prog)
            imports.foreach(processFile)
          case Left((code, err)) =>
            exitCode = code
            error = err
        }
      }
    }

    processFile(initialFile)

    exitCode match {
      case VALID_EXIT_STATUS => Right(importGraph)
      case _ => Left((exitCode, error))
    }

  }

  def generateAsm(prog: Prog, symbolTable: mutable.Map[String, Type]): String = {
    val MAX_UNROLLS = 5
    val controlFlow = new ControlFlow(prog, symbolTable, MAX_UNROLLS)
    val optimisedProg = {
      if (CONTROL_FLOW_OPTIMISATION) {
        controlFlow.CFProgram()
      } else {
        prog
      }
    }
    val irTranslator = new IRTranslator(optimisedProg, symbolTable, CONCURRENT_COMPILATION)
    val asmInstr = irTranslator.translate()
    val totalRegsUsed = irTranslator.getRegsUsed()
    val x86Code = new X86Translator(asmInstr, totalRegsUsed, CONCURRENT_COMPILATION).translate() match {
          case Left(value) => Await.result(value, Duration.Inf)
          case Right(value) => value
        }
    IntelX86Formatter.translate(x86Code)
  }

  def writeToFile(contents: String, filename: String): Int = {
    try {
      val writer = new PrintWriter(new File(filename))
      writer.write(contents)
      writer.close()
      VALID_EXIT_STATUS
    } catch {
      case _: Exception =>
        FAIL
    }
  }

  def removeFileExt(file: String): String = {
    val index = file.lastIndexOf('.')
    if (index > 0) file.substring(0, index)
    else file
  }

  private def extractFiles(files: Option[List[StrLit]]): Set[File] = {
    files match {
      case Some(imports) => imports.map({x => new File(x.s)}).toSet
      case None => Set.empty
    }
  }
}
