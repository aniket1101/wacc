import ast._

import scala.Option
import scala.io.Source
import scala.util.{Failure, Success, Try}
import scala.sys.exit

object Main {
    val VALID_EXIT_STATUS: Int = 0
    val SYNTAX_ERROR_EXIT_STATUS: Int = 100
    val SEMANTIC_ERROR_EXIT_STATUS: Int = 200
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

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
        parser.parse(str) match {
            case Right(ast) => {
                validator.check(ast) match {
                    case Some(_) => SEMANTIC_ERROR_EXIT_STATUS
                    case None => VALID_EXIT_STATUS
                }
            }
            case Left(_) => SYNTAX_ERROR_EXIT_STATUS
        }
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
