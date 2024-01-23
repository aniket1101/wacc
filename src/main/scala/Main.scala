import parsley.{Success, Failure}
import scala.io.Source

object Main {
    def main(args: Array[String]): Unit = {
        args.headOption match {
            case Some(filename) =>
                val fileContent = readFile(filename)
                parser.parse(fileContent) match {
                    case Success(x) => println(s"$fileContent = $x")
                    case Failure(msg) => println(msg)
                }
            case None => println("No file passed in.")
        }
    }

    private def readFile(filename: String): String = {
        try {
            val source = Source.fromFile(filename)
            val content = source.mkString
            source.close()
            content
        } catch {
            case e: Exception =>
                println(s"Error reading file $filename: ${e.getMessage}.")
                sys.exit(1)
        }
    }
}
