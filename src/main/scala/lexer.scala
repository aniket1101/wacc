import parsley.Parsley
import parsley.token.descriptions._
import parsley.token.symbol.ImplicitSymbol
import parsley.token.{Lexer, predicate}

object lexer {
    private val desc = LexicalDesc.plain.copy(
        nameDesc = NameDesc.plain.copy(
            identifierStart = predicate.Basic(_.isLetter),
            identifierLetter = predicate.Basic(_.isLetterOrDigit),
        ),
        spaceDesc = SpaceDesc.plain,
        symbolDesc = SymbolDesc.plain.copy(
            hardOperators = Set("+", "*"),
        )
    )
    private val lexer = new Lexer(desc)

    def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)
    val ident: Parsley[String] = lexer.lexeme.names.identifier
    val nat: Parsley[BigInt] = lexer.lexeme.unsigned.decimal

    val implicits: ImplicitSymbol = lexer.lexeme.symbol.implicits
}