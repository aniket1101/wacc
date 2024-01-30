import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.Parsley
import parsley.Parsley.{atomic, many, some}
import parsley.combinator.{sepBy, sepBy1}
import parsley.errors.ErrorBuilder
import parsley.expr._
import parsley.syntax.zipped._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = ("begin" ~> funcs, stmt <~ "end").zipped(Prog)
    private lazy val funcs: Parsley[List[Func]] = many(func)
    private lazy val func: Parsley[Func] = atomic(typ.zip(ident).zip("(" ~> paramList <~ ")")).zip("is" ~> stmt <~ "end").map({
        case (((t, i), e), s) => Func(t, i, e, s)
    })
    private lazy val stmt: Parsley[Stmt] = sepBy1(singleStmt, ";").map(listToStmt)
    private lazy val singleStmt: Parsley[Stmt] =
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
          atomic("if" ~> expr).zip("then" ~> stmt).zip("else" ~> stmt <~ "fi").map({ case ((c, s1), s2) => IfStmt(c, s1, s2) }) |
          // ‘while’ ⟨expr⟩ ‘do’ ⟨stmt⟩ ‘done’
          ("while" ~> expr, "do" ~> stmt <~ "done").zipped(WhileStmt) |
          // ‘begin’ ⟨stmt⟩ ‘end’
          ("begin" ~> stmt <~ "end").map(Begin)
    private lazy val ident: Parsley[Ident] = identifier.map(Ident)

    private lazy val typ: Parsley[Type] = atomic(arrayType) | baseType | pairType

    private lazy val paramList: Parsley[List[Param]] = sepBy(param, ",")
     private lazy val param: Parsley[Param] = (typ, ident).zipped(Param)

    // Types
    private lazy val baseType: Parsley[BaseType] = keyword("int", IntType()) | keyword("bool", BoolType()) |
      keyword("char", CharType()) | keyword("string", StringType())
    private lazy val arrayType: Parsley[ArrayType] = ((baseType | pairType) <~> some("[]")).map{case (bt, u) => toNestedArray(bt, u)}
    private lazy val pairType: Parsley[PairType] = ("pair" ~> "(" ~> pairElemType <~ "," <~> pairElemType <~ ")").map({ case (p1, p2) => PairType(p1, p2) })
    private lazy val pairElemType: Parsley[PairElemType] = atomic(arrayType) | baseType | keyword("pair", Pair())

    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(Prefix)("!" as Not, "len" as Len, "ord" as Ord, "chr" as Chr,
                "-" as {
                    case IntLit(x) => IntLit(-x)
                    case otherExpr => Neg(otherExpr)
                },
                "+" as (expr => expr)),
            Ops(InfixL)("*" as Mul, "/" as Div, "%" as Mod),
            Ops(InfixL)("+" as Add, "-" as Sub),
            Ops(InfixN)(">=" as GTE, ">" as GT, "<=" as LTE, "<" as LT),
            Ops(InfixN)("==" as Eq, "!=" as NEq),
            Ops(InfixR)("&&" as And),
            Ops(InfixR)("||" as Or)
        )
    private lazy val atom: Parsley[Atom] = atomic(arrayElem) |  identifier.map(Ident) | integers.map(IntLit) |
      boolLiterals.map(BoolLit) | charLiterals.map(CharLit) | stringLiterals.map(StrLit) |
      keyword("null", PairLiter())

    private lazy val lvalue: Parsley[LValue] = atomic(arrayElem) | atomic(pairElem) | identifier.map(Ident)
    private lazy val rvalue: Parsley[RValue] = atomic(expr) | ("call" ~> ident, "(" ~> argList <~ ")").zipped(Call) | arrayLit |
      ("newpair" ~> "(" ~> expr, "," ~> expr <~ ")").zipped(NewPair) | pairElem
    private lazy val argList: Parsley[ArgList] = sepBy(expr, ",").map(ArgList)
    private lazy val arrayLit: Parsley[ArrayLit] = ("[" ~> sepBy(expr, ",") <~ "]").map(ArrayLit)
    private lazy val arrayElem: Parsley[ArrayElem] = (identifier.map(Ident), some("[" ~> expr <~ "]")).zipped(ArrayElem)
    private lazy val pairElem: Parsley[PairElem] = ("fst" ~> lvalue).map(PairFst) | ("snd" ~> lvalue).map(PairSnd)

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

    private def toNestedArray(typ: Type, brackets: List[Unit]): ArrayType = {
        brackets match {
            case _ :: Nil => ArrayType(typ)
            case _ :: tail => ArrayType(toNestedArray(typ, tail))
        }
    }
}
