import ast._

import scala.annotation.tailrec

object Main {
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

    private def prettyPrint(prog: Either[String, Prog]): Unit = {
        prog match {
            case Right(Prog(funcs, stmts)) =>
                funcs.foreach {
                    case Func(typ, ident, paramList, stmts) =>
                        println(s"Func($typ $ident $paramList) is")
                        printStmts(stmts, 4)
                        println("end\n")
                }
                printStmts(stmts, 0)
        }
    }

    @tailrec
    private def printStmts(stmts: Stmt, indent: Int): Unit = {
        stmts match {
            case Stmts(s, ss) => {
                println(" " * indent + s)
                printStmts(ss, indent)
            }
            case s => println(" " * indent + s)

        }
    }

    val p: String = """
          |begin
          |int x = 2200000000
          |end
    """.stripMargin.stripLeading()

    def main(args: Array[String]): Unit = {
        val ast = parser.parse(p)
        println(p + "\npassed as:\n")
        prettyPrint(ast)
    }
}
