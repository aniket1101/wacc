// Import necessary packages and modules
import parser._
import validator.checkSemantics

import java.io.File
import scala.sys.exit
import scala.util.Success
import scala.util.Failure

// Object representing the main entry point of the program
object Main {
  // Define exit status codes
  val VALID_EXIT_STATUS: Int = 0
  val SYNTAX_ERROR_EXIT_STATUS: Int = 100
  val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
  private val FAIL: Int = -1

  // Main function of the program
  def main(args: Array[String]): Unit = {

    // Check if a file has been specified
    if (args.length < 1) {
      System.out.println("Source file unspecified")
      exit(FAIL)
    }

    // Parse the program and exit with the result
    exit(parseProgram(new File(args.head)))
  }

  // Function to parse the program file
  def parseProgram(source: File): Int = {
    val result = parse(source)
    result match {
      // If parsing is successful
      case Success(value) =>
        value match {
          // If parsing is successful according to the Parsley parser
          case parsley.Success(_) =>
            // Check semantics of the parsed program
            checkSemantics(value.get, source.toString) match {
              // If there are no semantic errors
              case (errors, _, _) =>
                if (errors.isEmpty) {
                  VALID_EXIT_STATUS
                } else {
                  // Print semantic errors and exit with semantic error status
                  println(errors.mkString("\n"))
                  SEMANTIC_ERROR_EXIT_STATUS
                }
            }
          // If parsing fails according to the Parsley parser
          case parsley.Failure(err) =>
            // Print syntax error and exit with syntax error status
            println(err)
            SYNTAX_ERROR_EXIT_STATUS
        }
      // If parsing fails
      case Failure(err) =>
        // Print parsing failure error and exit with general failure status
        println(err)
        FAIL
    }
  }
}
