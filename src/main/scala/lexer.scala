import parsley.Parsley
import parsley.token.Lexer
import parsley.token.predicate.Basic
import parsley.token.descriptions.{LexicalDesc, NameDesc, SymbolDesc, SpaceDesc}
import parsley.token.descriptions.numeric.{NumericDesc, ExponentDesc}
import parsley.token.descriptions.text.{TextDesc, EscapeDesc}

object lexer {
    final val keywords = Set(
        "begin",
        "end",
        "is",
        "skip",
        "read",
        "free",
        "return",
        "exit",
        "print",
        "println",
        "if",
        "then",
        "else",
        "fi",
        "while",
        "do",
        "done",
        "newpair",
        "call",
        "fst",
        "snd",
        "int",
        "bool",
        "char",
        "string",
        "pair",
        "true",
        "false",
        "null",
        "len",
        "ord",
        "chr"
    )
  
    final val operators = Set(
        "!",
        "-",
        "*",
        "/",
        "%",
        "+",
        ">",
        ">=",
        "<",
        "<=",
        "==",
        "!=",
        "&&",
        "||"
    )

    private val desc = LexicalDesc.plain.copy(
        nameDesc = NameDesc.plain.copy(
            identifierStart = Basic(_.isLetter),
            identifierLetter = Basic(_.isLetterOrDigit),
        ),
        symbolDesc = SymbolDesc.plain.copy(
            hardKeywords = keywords,
            hardOperators = operators
        ),
        numericDesc = NumericDesc.plain,
        textDesc = TextDesc.plain.copy(
            escapeSequences = EscapeDesc.plain.copy(
                escBegin = '\\',
                literals = Set.empty,
                mapping = Map(
                    "0" -> 0x0000,
                    "b" -> 0x0008,
                    "t" -> 0x0009,
                    "n" -> 0x000a,
                    "f" -> 0x000c,
                    "r" -> 0x000d,
                    "\""-> 0x0022,
                    "\'" -> 0x0027,
                    "\\" -> 0x005c
                )
            ),
            graphicCharacter = Basic(c => {
                (c != '"') && (c != '\'') && (c != '\\') && (c != '\n') && (c != '\t') && (c != '\r') && (c != '\f') && (c != '\b')
            })
        ),
        spaceDesc = SpaceDesc.plain.copy(
            lineCommentStart = "#"
        )
    )

    private val lexer = new Lexer(desc)

    def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)
    val ident: Parsley[String] = lexer.lexeme.names.identifier
    val nat: Parsley[BigInt] = lexer.lexeme.unsigned.decimal

    val implicits = lexer.lexeme.symbol.implicits
}