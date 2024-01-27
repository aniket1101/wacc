import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.Parsley
import parsley.Parsley.{atomic, many}
import parsley.combinator.sepBy
import parsley.errors.ErrorBuilder
import parsley.expr._
import parsley.syntax.zipped._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = ("begin" ~> funcs, stmts <~ "end").zipped(Prog)
    private lazy val funcs: Parsley[List[Func]] = many(func)
    private lazy val func: Parsley[Func] = atomic(typ.zip(ident).zip(paramList).zip(stmt)).map({
        case (((t, i), e), s) => Func(t, i, e, s)
    })
    private lazy val stmts: Parsley[Stmt] = sepBy(stmt, ";").map{listToStmt}
    private lazy val stmt: Parsley[Stmt] =
        // ‘skip’
        keyword("skip", Skip()) |
          // ⟨type⟩ ⟨ident⟩ ‘=’ ⟨rvalue⟩
          (((typ <~> ident) <~ "=") <~> rvalue).map({ case ((t, i), e) => Declaration(t, i, e) }) |
          // ⟨lvalue⟩ ‘=’ ⟨rvalue⟩
          (lvalue <~ "=", rvalue).zipped(Assign) |
          // ‘read’ ⟨lvalue⟩
          ("read" ~> lvalue).map(Read) |
          // ‘free’ ⟨expr⟩
          ("free" ~> expr).map(Free) |
          // ‘return’ ⟨expr⟩
          ("return" ~> expr).map(Return) |
          // ‘exit’ ⟨expr⟩
          ("exit" ~> expr).map(Exit) |
          // ‘print’ ⟨expr⟩
          ("print" ~> expr).map(Print) |
          // ‘println’ ⟨expr⟩
          ("println" ~> expr).map(Println) |
          // if’ ⟨expr⟩ ‘then’ ⟨stmt⟩ ‘else’ ⟨stmt⟩ ‘fi’
          atomic("if" ~> expr).zip("then" ~> stmts).zip("else" ~> stmts <~ "fi").map({ case ((c, s1), s2) => IfStmt(c, s1, s2) }) |
          // ‘while’ ⟨expr⟩ ‘do’ ⟨stmt⟩ ‘done’
          ("while" ~> expr, "do" ~> stmts <~ "done").zipped(WhileStmt) |
          // ‘begin’ ⟨stmt⟩ ‘end’
          ("begin" ~> stmts <~ "end").map(Begin)
        private lazy val ident: Parsley[Ident] = identifier.map(Ident)

        private lazy val typ: Parsley[Type] = baseType

        private lazy val paramList: Parsley[List[Param]] = sepBy(param, ",")
        private lazy val param: Parsley[Param] = (typ, ident).zipped(Param)

        // Types
        private lazy val baseType: Parsley[BaseType] = keyword("int", IntType()) | keyword("bool", BoolType()) |
          keyword("char", CharType()) | keyword("string", StringType())

        private lazy val expr: Parsley[Expr] =
            precedence(atom, "(" ~> expr <~ ")")(
                Ops(Prefix)("!" as Not, "len" as Len, "ord" as Ord, "chr" as Chr,
                    "-" as {
                        case IntLit(x) => IntLit(-x)
                        case otherExpr => Neg(otherExpr)
                    }),
                Ops(InfixL)("*" as Mul, "/" as Div),
                Ops(InfixL)("+" as Add, "-" as Sub),
                Ops(InfixN)(">=" as GTE, ">" as GT, "<=" as LTE, "<" as LT),
                Ops(InfixN)("==" as Eq, "!=" as NEq),
                Ops(InfixR)("&&" as And),
                Ops(InfixR)("||" as Or)
            )
        private lazy val atom: Parsley[Atom] = identifier.map(Ident) | integers.map(IntLit) |
          boolLiterals.map(BoolLit) | charLiterals.map(CharLit) | stringLiterals.map(StrLit)
        private lazy val lvalue: Parsley[LValue] = identifier.map(Ident)
        private lazy val rvalue: Parsley[RValue] = expr

        private def keyword[A](str: String, obj: A): Parsley[A] =
            atomic(str).map(_ => obj)

        private def listToStmt(stmts: List[Stmt]): Stmt = {
            stmts match {
                case Nil => Skip()
                case head :: Nil => head
                case stmt1 :: tail =>
                    Stmts(stmt1, listToStmt(tail))
            }
        }
    }
