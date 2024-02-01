import ast._

import scala.io.Source
import scala.util.{Failure, Success, Try}

object Main {
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
            case Right(_) => 0
            case Left(_) => 100
        }
    }

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
                    case Success(contents) => println(parseProgram(contents))
                    case Failure(_) => println(s"No file: $filename exists.")
                }
            case None => println("Please pass in a file.")
        }
    }
}
