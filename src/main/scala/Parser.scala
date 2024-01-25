import lexer.implicits.implicitSymbol
import lexer.{fully, ident, nat}
import parsley.Parsley
import parsley.Parsley._
import parsley.errors.ErrorBuilder
import parsley.errors.combinator.ErrorMethods
import parsley.expr.{InfixL, Ops, precedence}
import parsley.syntax.zipped._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = (asgns, expr).zipped(Prog)
    private lazy val asgns: Parsley[List[Asgn]] = many(asgn <~ ";")
    private lazy val asgn: Parsley[Asgn] = (atomic(ident.map(Var) <~ "=") <~> expr).map{case (v, e) => Asgn(v.v, e)}

    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(InfixL)("*" as Mul),
            Ops(InfixL)("+" as Add)
        )
    private lazy val atom: Parsley[Expr] = ident.map(Var) | nat.map(Val)

}
