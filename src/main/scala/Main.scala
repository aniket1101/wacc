import parser._
import validator.checkSemantics

import java.io.File
import scala.sys.exit
import scala.util.Success
import scala.util.Failure


object Main {
    val VALID_EXIT_STATUS: Int = 0
    val SYNTAX_ERROR_EXIT_STATUS: Int = 100
    val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
    val FAIL: Int = -1

    def main(args: Array[String]): Unit = {
      if (args.length < 1) {
        System.out.println("Source file unspecified")
        exit(FAIL)
      }

      exit(parseProgram(new File(args.head)))
    }
  def parseProgram(source: File): Int = {
    val result = parse(source)
    result match {
      case Success(value) =>
        value match {
          case parsley.Success(_) =>
            checkSemantics(value.get, source.toString) match {
              case (errors, _, _) =>
                if (errors.isEmpty) {
                  VALID_EXIT_STATUS
                } else {
                  println(errors.mkString("\n"))
                  SEMANTIC_ERROR_EXIT_STATUS
                }
            }
          case parsley.Failure(err) =>
            println(err)
            SYNTAX_ERROR_EXIT_STATUS
        }
      case Failure(err) =>
        println(err)
        FAIL
    }
  }
}
