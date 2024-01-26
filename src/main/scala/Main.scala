object Main {
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

    def main(args: Array[String]): Unit = {
        val p: String = format("int e = x * (5 * z)")
        val ast = parser.parse(p)
        println(p + "\npassed as:\n" + ast)
    }
}
