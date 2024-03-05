// Import necessary packages and modules
import backend.X86Translator
import backend._
import extensions.dfs.getTopologicalSorting
import frontend.ast._
import frontend.parser._
import frontend.validator.checkSemantics

import java.io.{File, PrintWriter}
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.sys.exit
import scala.util.{Failure, Success}

// Object representing the main entry point of the program
object Main {
  // Define exit status codes
  val VALID_EXIT_STATUS: Int = 0
  val SYNTAX_ERROR_EXIT_STATUS: Int = 100
  val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
  private val FAIL: Int = -1
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

  // Function to parse the program file
  def parseProgram(source: File): Either[Int, (Prog, mutable.Map[String, Type])] = {
    val result = parse(source)
    result match {
      // If parsing is successful
      case Success(value) =>
        value match {
          // If parsing is successful according to the Parsley parser
          case parsley.Success(newValue) =>
            // Check semantics of the parsed program
            checkSemantics(newValue, source.toString) match {
              // If there are no semantic errors
              case (errors, prog, symbolTable) =>
                if (errors.isEmpty) {
                  Right((prog, symbolTable))
                } else {
                  // Print semantic errors and exit with semantic error status
                  println(errors.map(err => err.display).mkString("\n"))
                  Left(SEMANTIC_ERROR_EXIT_STATUS)
                }
            }
          // If parsing fails according to the Parsley parser
          case parsley.Failure(err) =>
            // Print syntax error and exit with syntax error status
            println(err.display)
            Left(SYNTAX_ERROR_EXIT_STATUS)
        }
      // If parsing fails
      case Failure(err) =>
        // Print parsing failure error and exit with general failure status
        println(err)
        Left(FAIL)
    }
  }

  def parseProgramToAST(source: File): Either[Int, Prog] = {
    val result = parse(source)
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
            Left(SYNTAX_ERROR_EXIT_STATUS)
        }
      // If parsing fails
      case Failure(err) =>
        // Print parsing failure error and exit with general failure status
        println(err)
        Left(FAIL)
    }
  }

  def parseImports(initialFile: File): Either[Int, mutable.Map[File, (Set[File], Prog)]] = {
    val importGraph = mutable.Map[File, (Set[File], Prog)]()
    val visited = mutable.Set[File]()
    var exitCode = VALID_EXIT_STATUS

    def processFile(file: File): Unit = {
      if (!visited.contains(file)) {
        parseProgramToAST(file) match {
          case Right(prog) =>
            visited.add(file)
            val imports = extractFiles(prog.imports)
            importGraph(file) = (imports, prog)
            imports.foreach(processFile)
          case Left(code) => exitCode = code
        }
      }
    }

    processFile(initialFile)

    exitCode match {
      case VALID_EXIT_STATUS => Right(importGraph)
      case _ => Left(exitCode)
    }

  }

  def generateAsm(prog: Prog, symbolTable: mutable.Map[String, Type]): String = {
    val irTranslator = new IRTranslator(prog, symbolTable)
    val asmInstr = irTranslator.translate()
    val totalRegsUsed = irTranslator.getRegsUsed()
    val x86Code = new X86Translator(asmInstr, totalRegsUsed).translate()
    IntelX86Formatter.translate(x86Code)
  }

  def compileProgram(source: String): Int = {
    val mainFile = new File(source)

    // Combines multiple wacc programs into a map of file to its ast
    parseImports(mainFile) match {
      case Right(importGraph) =>
        var outputFunc: List[Func] = List()

        // Combine other ASTs
        getTopologicalSorting(importGraph).foreach { case (filename, (_, prog)) =>
          val renamedFuncs = prog.funcs.map(_.addLibraryPrefix(removeFileExt(filename.getName)))
          outputFunc = outputFunc.concat(renamedFuncs)
        }

        // Perform semantic check
        val combinedProg = new Prog(Option.empty, outputFunc, importGraph(mainFile)._2.stats)(nullPos)
        checkSemantics(combinedProg, mainFile.toString) match {
          // If there are no semantic errors
          case (errors, outputProg, symbolTable) =>
            if (errors.isEmpty) {
              // Compile program
              val asmCode = generateAsm(outputProg, symbolTable)
              writeToFile(asmCode, removeFileExt(mainFile.getName) + ".s") match {
                case VALID_EXIT_STATUS => VALID_EXIT_STATUS
                case err =>
                  println("Failed to write to output file")
                  err
              }
            } else {
              // Print semantic errors and exit with semantic error status
              println(errors.map(err => err.display).mkString("\n"))
              SEMANTIC_ERROR_EXIT_STATUS
            }
        }

      case Left(exitCode) => exitCode
    }
  }

  private def writeToFile(contents: String, filename: String): Int = {
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
