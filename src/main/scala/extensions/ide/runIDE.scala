package extensions.ide

import frontend.parser.parse
import main.Main.removeFileExt

import java.io.File
import scala.util.{Failure, Success}

object runIDE {
  private val assertLibrary: File = new File("src/lib/assertions.wacc")
  def main(args: Array[String]): Unit = {
    new IDE().run()
  }

  def importAssertTypes(): Set[String] = {
    val libName = removeFileExt(assertLibrary.getName)
    parse(assertLibrary) match {
      case Success(value) => value match {
        case parsley.Success(prog) =>
          prog.funcs.map(_.ident.name).map(func => s"$libName.$func").toSet
        case _: parsley.Failure[_] =>
          println("Error in Compiling Assertion Library")
          Set()
      }
      case Failure(_) => println("Error in Compiling Assertion Library")
        Set()
    }
  }
}
