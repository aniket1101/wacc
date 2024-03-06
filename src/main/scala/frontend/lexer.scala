package frontend

import parsley.character.string
import parsley.token.Lexer
import parsley.token.descriptions.numeric.{BreakCharDesc, ExponentDesc, NumericDesc, PlusSignPresence}
import parsley.token.descriptions.text.{EscapeDesc, TextDesc}
import parsley.token.descriptions.{LexicalDesc, NameDesc, SpaceDesc, SymbolDesc}
import parsley.token.predicate.Basic
import parsley.token.symbol.ImplicitSymbol
import parsley.{Parsley, character}

import scala.collection.immutable.Set

// Object containing lexer-related functionality
object lexer {
    // Set of keywords recognized by the lexer
    private final val keywords = Set("begin", "end", "import", "is", "skip", "read", "free", "return", "exit", "print",
        "println", "if", "then", "else", "fi", "while", "do", "done", "newpair", "call", "fst",
        "snd", "int", "bool", "char", "string", "pair", "true", "false", "null", "len", "ord", "chr")

    // Set of operators recognized by the lexer
    private final val operators = Set("!", "-", "*", "/", "%", "+", ">", ">=", "<", "<=", "==", "!=", "&&", "||")

    // Lexical description used by the lexer
    private val desc = LexicalDesc.plain.copy(
        nameDesc = NameDesc.plain.copy(
            // Predicate for first character of an identifier
            identifierStart = Basic((c: Char) => c.isLetter || c == '_' || c == '.'),
            // Predicate for rest of characters of an identifier
            identifierLetter = Basic((c: Char) => c.isLetterOrDigit || c == '_' || c == '.'),
        ),
        symbolDesc = SymbolDesc.plain.copy(
            hardKeywords = keywords,
            hardOperators = operators
        ),
        numericDesc = NumericDesc.plain.copy(
            decimalExponentDesc = ExponentDesc.Supported.apply(compulsory = false,
                        chars = Set('.'),
                        base = 10,
                        positiveSign = PlusSignPresence.Optional,
                        leadingZerosAllowed = false)
                    ),

        textDesc = TextDesc.plain.copy(
            escapeSequences = EscapeDesc.plain.copy(
                // Escape characters
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

    // Lexer instance initialized with the lexical description
    val lexer = new Lexer(desc)

    // Function to parse a Parsley parser until the end of input
    def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)

    // Parsley parser for identifiers
    val identifier: Parsley[String] = lexer.lexeme.names.identifier
    // Parsley parser for integers
    val integers: Parsley[Int] = lexer.lexeme.signed.decimal32
    val doubles: Parsley[Double] = lexer.lexeme.floating.exactDouble
    // Parsley parser for character literals
    val charLiterals: Parsley[Char] = lexer.lexeme.character.ascii
    // Parsley parser for string literals
    val stringLiterals: Parsley[String] = lexer.lexeme.string.ascii
    // Parsley parser for boolean literals
    val boolLiterals: Parsley[Boolean] = (string("true") <~ character.whitespaces).as(true) |
      (string("false") <~ character.whitespaces).as(false)
    // Implicit symbol for the lexer
    val implicits: ImplicitSymbol = lexer.lexeme.symbol.implicits
}
