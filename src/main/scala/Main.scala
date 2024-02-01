import ast._

import scala.annotation.tailrec

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

    val p: String = """
          |begin
          |int x = +5
          |end
    """.stripMargin.stripLeading()

    def main(args: Array[String]): Unit = {
        val ast = parser.parse(p)
        println(p + "\npassed as:\n")
        prettyPrint(ast)
    }
}
