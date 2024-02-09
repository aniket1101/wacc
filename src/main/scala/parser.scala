import ast._
import lexer.implicits.implicitSymbol
import lexer._
import parsley.{Parsley, Result}
import parsley.Parsley.{atomic, many, some}
import parsley.combinator.{sepBy, sepBy1}
import parsley.expr._
import waccErrors._
import parsley.errors.combinator._

import java.io.File
import scala.util.Try

object parser {
    // Use a custom error builder
    implicit val waccErrorBuilder: WaccErrorBuilder = new WaccErrorBuilder
    def parse(file: File): Try[Result[WaccError, Prog]] = parser.parseFile(file)

    private lazy val parser = fully(prog)
    private lazy val prog: Parsley[Prog] = fully("begin" ~> Prog(many(func), sepBy1(singleStat, ";")) <~ "end")
    private lazy val func: Parsley[Func] = atomic(Func(typ, ident, "(" ~> sepBy(param, ",") <~ ")", "is" ~>
      sepBy1(singleStat, ";").filter(stmts => functionExits(stmts.last)) <~ "end")).label("function declaration")

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
      If("if" ~> expr, "then" ~> stats, "else".explain("all if statements must have an else statement") ~> stats <~ "fi".explain("unclosed if statement")) <|>
      While("while" ~> expr, "do" ~> stats <~ "done".explain("unclosed while statement")) <|>
      Scope("begin" ~> stats <~ "end")

    private lazy val declaration: Parsley[Declaration] = Declaration(typ, ident, "=" ~> rvalue).label("declaration")
    private lazy val assign: Parsley[Assign] = Assign(lvalue, "=" ~> rvalue).label("assignment")

    private lazy val ident: Parsley[Ident] = Ident(identifier).label("identifier")

    private lazy val typ: Parsley[Type] =  chain.postfix(baseType <|> pairType)(ArrayType <# ("[" <* "]"))

    private lazy val param: Parsley[Param] = Param(typ, ident).label("parameter")

    // Types
    private lazy val baseType: Parsley[BaseType] = (IntType <# "int") <|> (BoolType <# "bool") <|> (CharType <# "char") <|> (StringType <# "string")
    private lazy val arrayType: Parsley[ArrayType] = chain.postfix1(baseType <|> pairType)(ArrayType <# ("[" <~> "]"))
    private lazy val pairType: Parsley[PairType] = PairType("pair" ~> "(" ~> pairElemType, "," ~> pairElemType <~ ")")

    private lazy val pairElemType: Parsley[PairElemType] = atomic(arrayType) | baseType | (Pair <# "pair")

    private lazy val unOpp: Parsley[Expr] = (Not("!" ~> unOppExpr) <|>
      (Neg("-" ~> unOppExpr).map({
          case p@Neg(IntLit(x)) => IntLit(-x)(p.pos)
          case otherExpr => Neg(otherExpr)(otherExpr.pos)
      }) <|>
      Len("len" ~> unOppExpr) <|>
      Ord("ord" ~> unOppExpr) <|>
      Chr("chr" ~> unOppExpr)) <|>
      Plus("+" ~> numericUnOppExpr).map(expr => expr)).label("unary operator")

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
    private lazy val arrayLit: Parsley[ArrayLit] = ArrayLit("[" ~> sepBy(expr, ",") <~ "]").label("array literal")
    private lazy val arrayElem: Parsley[ArrayElem] = ArrayElem(Ident(identifier), some("[" ~> expr <~ "]")).label("array element")
    private lazy val pairElem: Parsley[PairElem] = PairFst("fst" ~> lvalue) | PairSnd("snd" ~> lvalue).label("pair element")

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
