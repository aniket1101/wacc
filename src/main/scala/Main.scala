import parser._
import Validator.checkSemantics

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
      if(args.length < 1) {
        System.out.println("Source file unspecified")
        exit(FAIL)
      }

      val file = args.head
      val source = new File(file)
      val result = parse(source)
      result match {
        case Success(value) =>
          value match {
            case parsley.Success(_) =>
              checkSemantics(value.get, file) match {
                case (errors, newProg, symTable) =>
                  if(errors.isEmpty) {
//                    println(newProg)
//                    println(symTable)
                    exit(VALID_EXIT_STATUS)
                  } else {
                    println(errors.mkString("\n"))
                    exit(SEMANTIC_ERROR_EXIT_STATUS)
                  }
              }
            case parsley.Failure(err) =>
              println(err)
              exit(SYNTAX_ERROR_EXIT_STATUS)
          }
        case Failure(err) =>
          println(err)
          exit(FAIL)
      }
    }
}
