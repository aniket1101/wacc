import ast._

import scala.annotation.unused
import scala.io.Source
import scala.sys.exit
import scala.util.{Failure, Success, Try}

object Main {
    val VALID_EXIT_STATUS: Int = 0
    val SYNTAX_ERROR_EXIT_STATUS: Int = 100
    val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
    @unused
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

    @unused
    private def prettyPrint(prog: Either[String, Prog]): Unit = {
        prog match {
            case Right(Prog(funcs, stats)) =>
                funcs.foreach {
                    case Func(typ, ident, paramList, stats) =>
                        println(s"Func($typ $ident $paramList) is")
                        printStats(stats, 4)
                        println("end\n")
                }
                printStats(stats, 0)
        }
    }

    private def printStats(stats: List[Stat], indent: Int): Unit = {
        for (stat <- stats) {
            println(" " * indent + stat)
        }
    }

    def parseProgram(str: String): Int = {
      0
//        parser.parse(str) match {
        //TODO: Implement semantic checker and edit this function

//            case Right(ast) =>
//                val validator = new Validator(str.split("\n"))
//                validator.check(ast) match {
//                    case Some(errorMsg) => {
//                        println(errorMsg)
//                        SEMANTIC_ERROR_EXIT_STATUS
//                    }
//                    case None => VALID_EXIT_STATUS
//                }
//            case Left(_) => SYNTAX_ERROR_EXIT_STATUS
//        }
    }

    // TO DO: Use parseFile for error builder
    def readFileContents(filename: String): Try[String] = {
        Try {
            val source = Source.fromFile(filename)
            try {
                source.mkString
            } finally {
                source.close()
            }
        }
    }

    def main(args: Array[String]): Unit = {
        args.headOption match {
            case Some(filename) =>
                readFileContents(filename) match {
                    case Success(contents) => exit(parseProgram(contents))
                    case Failure(_) => println(s"No file: $filename exists.")
                }
            case None => println("Please pass in a file.")
        }
    }
}
