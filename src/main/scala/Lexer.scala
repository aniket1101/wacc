// import parsley.Parsley
// import parsley.token.Lexer
// import parsley.token.descriptions._

// object lexer {
//     private val desc = LexicalDesc.plain.copy(
//         // your configuration goes here
//     )
//     private val lexer = new Lexer(desc)

//     val integer = lexer.lexeme.integer.decimal
//     val implicits = lexer.lexeme.symbol.implicits
//     def fully[A](p: Parsley[A]): Parsley[A] = lexer.fully(p)
// }

import parsley.Parsley
import parsley.token.{Lexer, predicate}
import parsley.token.descriptions._
import parsley.token.errors.{ErrorConfig, Label, LabelConfig}
import parsley.token.symbol.ImplicitSymbol

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