import lexer.implicits.implicitSymbol
import lexer.{fully, ident, nat}
import parsley.Parsley
import parsley.Parsley._
import parsley.errors.ErrorBuilder
import parsley.expr.{InfixL, InfixN, InfixR, Ops, Prefix, precedence}
import parsley.syntax.zipped._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = expr.map(Prog)

    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(Prefix)("!" as Not, "-" as Neg, "len" as Len, "ord" as Ord, "chr" as Chr),
            Ops(InfixL)("*" as Mul, "/" as Div),
            Ops(InfixL)("+" as Add, "-" as Sub),
            Ops(InfixN)(">=" as GTE, ">" as GT,  "<=" as LTE, "<" as LT),
            Ops(InfixN)("==" as Eq, "!=" as NEq),
            Ops(InfixR)("&&" as And),
            Ops(InfixR)("||" as Or)
        )
    private lazy val atom: Parsley[Expr] = ident.map(Ident) | nat.map(IntLit)
}
