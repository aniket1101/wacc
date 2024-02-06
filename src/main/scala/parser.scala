import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.Parsley
import parsley.Parsley.{atomic, many, some}
import parsley.combinator.{sepBy, sepBy1}
import parsley.errors.ErrorBuilder
import parsley.expr._

object parser {
    def parse[Err: ErrorBuilder](input: String): Either[Err, Prog] = parser.parse(input).toEither

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = fully("begin" ~> Prog(many(func), sepBy1(singleStat, ";")) <~ "end")
    private lazy val func: Parsley[Func] = atomic(Func(typ, ident, "(" ~> sepBy(param, ",") <~ ")", "is" ~>
      sepBy1(singleStat, ";").filter(stmts => functionExits(stmts.last)) <~ "end"))

    private lazy val stats = sepBy1(singleStat, ";")

    private lazy val singleStat: Parsley[Stat] =
        // `return`
      Return("return" ~> expr) <|>
      // ‘skip’
      (Skip <# "skip") <|>
      Read("read" ~> lvalue) <|>
      Free("free" ~> expr) <|>
      Exit("exit" ~> expr) <|>
      Println("println" ~> expr) <|>
      Print("print" ~> expr) <|>
      declaration <|>
      assign <|>
      If("if" ~> expr, "then" ~> stats, "else" ~> stats <~ "fi") <|>
      While("while" ~> expr, "do" ~> stats <~ "done") <|>
      Scope("begin" ~> stats <~ "end")

    private lazy val declaration: Parsley[Declaration] = Declaration(typ, ident, "=" ~> rvalue)
    private lazy val assign: Parsley[Assign] = Assign(lvalue, "=" ~> rvalue)

    private lazy val ident: Parsley[Ident] = Ident(identifier)

    private lazy val typ: Parsley[Type] =  chain.postfix(baseType <|> pairType)(ArrayType <# ("[" <* "]"))

    private lazy val param: Parsley[Param] = Param(typ, ident)

    // Types
    private lazy val baseType: Parsley[BaseType] = (IntType <# "int") <|> (BoolType <# "bool") <|> (CharType <# "char") <|> (StringType <# "string")
    private lazy val arrayType: Parsley[ArrayType] = chain.postfix1(baseType <|> pairType)(ArrayType <# ("[" <~> "]"))
    private lazy val pairType: Parsley[PairType] = PairType("pair" ~> "(" ~> pairElemType, "," ~> pairElemType <~ ")")

    private lazy val pairElemType: Parsley[PairElemType] = atomic(arrayType) | baseType | (Pair <# "pair")

    private lazy val unOpp: Parsley[UnOpp] =
      (Not("!" ~> unOppExpr) <|>
      Neg("-" ~> unOppExpr) <|>
      Len("len" ~> unOppExpr) <|>
      Ord("ord" ~> unOppExpr) <|>
      Chr("chr" ~> unOppExpr)) <|>
      Plus("+" ~> numericUnOppExpr)

    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(InfixL)(Mul <# "*", Div <# "/", Mod <# "%"),
            Ops(InfixL)(Add <# "+", Sub <# "-"),
            Ops(InfixN)(GTE <# ">=", GT <# ">", LTE <# "<=", LT <# "<"),
            Ops(InfixN)(Eq <# "==", NEq <# "!="),
            Ops(InfixR)(And <# "&&"),
            Ops(InfixR)(Or <# "||")
        )

    private lazy val unOppExpr: Parsley[Expr] = atom <|> ("(" ~> expr <~ ")")
    private lazy val numericUnOppExpr: Parsley[Expr] = IntLit(integers) | unOpp

    private lazy val atom: Parsley[Expr] = atomic(arrayElem) |  Ident(identifier) | IntLit(integers) |
      BoolLit(boolLiterals) | CharLit(charLiterals) | StrLit(stringLiterals) | unOpp |
      (PairLiter <# "null")

    private lazy val lvalue: Parsley[LValue] = atomic(arrayElem) | atomic(pairElem) | Ident(identifier)
    private lazy val rvalue: Parsley[RValue] = atomic(expr) | Call("call" ~> ident, "(" ~> sepBy(expr, ",") <~ ")") | arrayLit |
      NewPair("newpair" ~> "(" ~> expr, "," ~> expr <~ ")") | pairElem
    private lazy val arrayLit: Parsley[ArrayLit] = ArrayLit("[" ~> sepBy(expr, ",") <~ "]")
    private lazy val arrayElem: Parsley[ArrayElem] = ArrayElem(Ident(identifier), "[" ~> expr <~ "]")
    private lazy val pairElem: Parsley[PairElem] = PairFst("fst" ~> lvalue) | PairSnd("snd" ~> lvalue)

    private def functionExits(stmt: Stat): Boolean = {
        stmt match {
            case Return(_) => true
            case Exit(_) => true
            case If(_, thenStmt, elseStmt) => functionExits(thenStmt.last) && functionExits(elseStmt.last)
            case Scope(stmts) => functionExits(stmts.last)
            case _ => false
        }
    }
}
