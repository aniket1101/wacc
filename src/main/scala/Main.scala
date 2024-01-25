import parsley.{Success, Failure}
import scala.io.Source

object Main {
    def main(args: Array[String]): Unit = {
        val x = parser.parse("-12 < 12")
        println("hello WACC!")
    }
}
