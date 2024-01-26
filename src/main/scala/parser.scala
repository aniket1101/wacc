import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.Parsley
import parsley.Parsley.{atomic, many}
import parsley.combinator.sepBy
import parsley.errors.ErrorBuilder
import parsley.expr._
import parsley.character
import parsley.character.string
import parsley.syntax.zipped._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = (lexeme(string("begin")) ~> funcs, stmt <~ string("end")).zipped(Prog)
    private lazy val funcs: Parsley[List[Func]] = many(func)
    private lazy val func: Parsley[Func] = atomic(typ.zip(ident).zip(paramList).zip(stmt)).map({
        case (((t, i), e), s) => Func(t, i, e, s)
    })
    private lazy val stmt: Parsley[Stmt] = (((typ <~> ident) <~ "=") <~> expr).map({
        case((t, i), e) => Declaration(t, i, e)
    })
    private lazy val ident: Parsley[Ident] = identifier.map(Ident)

    private lazy val typ: Parsley[Type] = lexeme(baseType)

    private lazy val paramList: Parsley[List[Param]] = sepBy(param, ",")
    private lazy val param: Parsley[Param] = (typ, ident).zipped(Param)

    // Types
    private lazy val baseType: Parsley[BaseType] = intType.map(_ => IntType()) | boolType.map(_ => BoolType()) |
      charType.map(_ => CharType()) | stringType.map(_ => StringType())

    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(Prefix)("!" as Not, "len" as Len, "ord" as Ord, "chr" as Chr,
                "-" as {
                    case IntLit(x) => IntLit(-x)
                    case otherExpr => Neg(otherExpr)
                }),
            Ops(InfixL)("*" as Mul, "/" as Div),
            Ops(InfixL)("+" as Add, "-" as Sub),
            Ops(InfixN)(">=" as GTE, ">" as GT,  "<=" as LTE, "<" as LT),
            Ops(InfixN)("==" as Eq, "!=" as NEq),
            Ops(InfixR)("&&" as And),
            Ops(InfixR)("||" as Or)
        )
    private lazy val atom: Parsley[Expr] = identifier.map(Ident) | integers.map(IntLit) | boolLiterals.map(BoolLit) |
      charLiterals.map(CharLit) | stringLiterals.map(StrLit)

    def lexeme[A](p: Parsley[A]): Parsley[A] = p <~ character.whitespaces
}
