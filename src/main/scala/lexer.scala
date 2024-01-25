import parsley.Parsley
import parsley.token.descriptions._
import parsley.token.symbol.ImplicitSymbol
import parsley.token.{Lexer, predicate}

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
        "len",
        "ord",
        "chr",
        "*",
        "/",
        "+",
        "-",
        ">=",
        ">",
        "<=",
        "<",
        "==",
        "!=",
        "&&",
        "||"
    )

    private val desc = LexicalDesc.plain.copy(
        nameDesc = NameDesc.plain.copy(
            identifierStart = predicate.Basic(_.isLetter),
            identifierLetter = predicate.Basic(_.isLetterOrDigit),
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
                singleMap = Map(
                    '0' -> 0x0000,
                    'b' -> 0x0008,
                    't' -> 0x0009,
                    'n' -> 0x000a,
                    'f' -> 0x000c,
                    'r' -> 0x000d,
                    '"' -> 0x0022,
                    '\'' -> 0x0027,
                    '\\' -> 0x005c
                ),
                graphicCharacter = predicate.Basic(c => {
                    (c != '"') && (c != '\'') && (c != '\\') && (c != '\n') && (c != '\t') && (c != '\r') && (c != '\f') && (c != '\b')
                })
            )
        ),
        spaceDesc = SpaceDesc.plain.copy(
            commentLine = "#",
            space = predicate.Basic(_.isWhitespace)
        )
    )
    
    private val lexer = new Lexer(desc)

    def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)
    val ident: Parsley[String] = lexer.lexeme.names.identifier
    val nat: Parsley[BigInt] = lexer.lexeme.unsigned.decimal

    val implicits: ImplicitSymbol = lexer.lexeme.symbol.implicits
}