import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.Parsley
import parsley.Parsley.many
import parsley.character.string
import parsley.errors.ErrorBuilder
import parsley.expr._
import parsley.combinator.sepBy

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = (string("begin") ~> funcs, stmt <~ string("end")).zipped(Prog)
    private lazy val funcs: Parsley[List[Func]] = many(funcs)
    private lazy val func: Parsley[Func] = (typ, ident, paramList)
    private lazy val stmt: Parsley[Stmt] = (typ, ident, expr).zipped(Declaration)
    private lazy val ident: Parsley[Ident] = identifier.map(Ident)
    private lazy val typ: Parsley[Type] = baseType
    private lazy val paramList = sepBy(param, ",")
    private lazy val param: Parsley[Param] = (typ, ident)

    // Types
    private lazy val baseType: Parsley[BaseType] = intType.map(IntType) | boolType.map(BoolType) |
      charType.map(CharType) | stringType.map(StringType)

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
    private lazy val atom: Parsley[Expr] = identifier.map(Ident) | integers.map(IntLit) | boolLiterals.map(BoolLit) |
      charLiterals.map(CharLit) | stringLiterals.map(StrLit)
}
