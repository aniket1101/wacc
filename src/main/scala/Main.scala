import ast._

import scala.annotation.tailrec

object Main {
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

    val p: String = """
          |begin
          |  int add(int x, int y) is
          |    return x + y
          |  end
          |
          |  int result = call add(3, 4)
          |end
    """.stripMargin.stripLeading()

    private def prettyPrint(prog:  Either[String, Prog]): Unit = {
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
    def printStmts(stmts: Stmt, indent: Int): Unit = {
        stmts match {
            case Stmts(s, ss) => {
                println(" " * indent + s)
                printStmts(ss, indent)
            }
            case s => println(" " * indent +s)

        }
    }

    def main(args: Array[String]): Unit = {
        val ast = parser.parse(p)
        println(p + "\npassed as:\n")
        prettyPrint(ast)
    }
}
