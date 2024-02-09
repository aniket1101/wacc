import parsley.character.string
import parsley.token.Lexer
import parsley.token.descriptions.numeric.NumericDesc
import parsley.token.descriptions.text.{EscapeDesc, TextDesc}
import parsley.token.descriptions.{LexicalDesc, NameDesc, SpaceDesc, SymbolDesc}
import parsley.token.predicate.Basic
import parsley.token.symbol.ImplicitSymbol
import parsley.{Parsley, character}

object lexer {
    private final val keywords = Set("begin", "end", "is", "skip", "read", "free", "return", "exit", "print",
        "println", "if", "then", "else", "fi", "while", "do", "done", "newpair", "call", "fst",
        "snd", "int", "bool", "char", "string", "pair", "true", "false", "null", "len", "ord", "chr")

    private final val operators = Set("!", "-", "*", "/", "%", "+", ">", ">=", "<", "<=", "==", "!=", "&&", "||")

    private val desc = LexicalDesc.plain.copy(
        nameDesc = NameDesc.plain.copy(
            identifierStart = Basic((c: Char) => c.isLetter || c == '_'),
            identifierLetter = Basic((c: Char) => c.isLetterOrDigit || c == '_'),
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
                mapping = Map("0" -> 0x0000, "b" -> 0x0008, "t" -> 0x0009, "n" -> 0x000a,
                    "f" -> 0x000c, "r" -> 0x000d, "\"" -> 0x0022, "\'" -> 0x0027, "\\" -> 0x005c)
            ),
            graphicCharacter = Basic(c => {
                (c != '"') && (c != '\'') && (c != '\\') && (c != '\n') && (c != '\t') && (c != '\r') && (c != '\f') && (c != '\b')
            })
        ),
        spaceDesc = SpaceDesc.plain.copy(
            lineCommentStart = "#"
        )
    )

    val lexer = new Lexer(desc)

    def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)

    val identifier: Parsley[String] = lexer.lexeme.names.identifier
    val integers: Parsley[Int] = lexer.lexeme.signed.decimal32
    val charLiterals: Parsley[Char] = lexer.lexeme.character.ascii
    val stringLiterals: Parsley[String] = lexer.lexeme.string.ascii
    val boolLiterals: Parsley[Boolean] = (string("true") <~ character.whitespaces).as(true) |
      (string("false") <~ character.whitespaces).as(false)
    val implicits: ImplicitSymbol = lexer.lexeme.symbol.implicits
}