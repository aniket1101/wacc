object Main {
    def format(code: String): String = {"begin\n\t" + code + "\nend"}

    val p: String = """
          |begin
          |    begin
          |    int x = 1 + 2;
          |    println x
          |    end
          |end
    """.stripMargin

    def main(args: Array[String]): Unit = {
        val ast = parser.parse(p)
        println(p + "\npassed as:\n" + ast)
    }
}
