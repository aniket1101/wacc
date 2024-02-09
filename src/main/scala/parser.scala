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

    // Function to parse a file and return a result
    def parse(file: File): Try[Result[WaccError, Prog]] = parser.parseFile(file)

    // Lazy initialization of parser
    private lazy val parser = fully(prog)

    // Lazy initialization of the main program parser
    private lazy val prog: Parsley[Prog] =
    // Parsing a complete program
        fully("begin" ~> Prog(many(func), sepBy1(singleStat, ";")) <~ "end")

    // Lazy initialization of function parser
    private lazy val func: Parsley[Func] = atomic(
        Func(
            typ, // Function return type
            ident, // Function identifier
            "(" ~> sepBy(param, ",") <~ ")", // Function parameters
            "is" ~> sepBy1(singleStat, ";").filter(stmts => functionExits(stmts.last)) <~ "end"
        )
    ).label("function declaration") // Labeling the parser for function declaration

    private lazy val stats = sepBy1(singleStat, ";") // Parser for multiple statements

    // Parser for single statement
    private lazy val singleStat: Parsley[Stat] =
    // Parsing different kinds of statements
        Return("return" ~> expr) <|>
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
          Scope("begin" ~> stats <~ "end") // Parsing a block of statements

    // Parser for variable declaration
    private lazy val declaration: Parsley[Declaration] = Declaration(typ, ident, "=" ~> rvalue).label("declaration")

    // Parser for assignment
    private lazy val assign: Parsley[Assign] = Assign(lvalue, "=" ~> rvalue).label("assignment")

    // Parser for identifier
    private lazy val ident: Parsley[Ident] = Ident(identifier).label("identifier")

    // Parser for type
    private lazy val typ: Parsley[Type] =
    // Parsing types
        chain.postfix(baseType <|> pairType)(ArrayType <# ("[" <* "]"))

    // Parser for function parameter
    private lazy val param: Parsley[Param] = Param(typ, ident).label("parameter")

    // Parser for base types
    private lazy val baseType: Parsley[BaseType] =
        (IntType <# "int") <|> (BoolType <# "bool") <|> (CharType <# "char") <|> (StringType <# "string")

    // Parser for array types
    private lazy val arrayType: Parsley[ArrayType] =
        chain.postfix1(baseType <|> pairType)(ArrayType <# ("[" <~> "]"))

    // Parser for pair types
    private lazy val pairType: Parsley[PairType] =
        PairType("pair" ~> "(" ~> pairElemType, "," ~> pairElemType <~ ")")

    // Parser for pair element types
    private lazy val pairElemType: Parsley[PairElemType] =
        atomic(arrayType) | baseType | (Pair <# "pair")

    // Parser for unary operators
    private lazy val unOpp: Parsley[Expr] =
        (Not("!" ~> unOppExpr) <|>
          (Neg("-" ~> unOppExpr).map({
              case p@Neg(IntLit(x)) => IntLit(-x)(p.pos)
              case otherExpr => Neg(otherExpr)(otherExpr.pos)
          }) <|>
            Len("len" ~> unOppExpr) <|>
            Ord("ord" ~> unOppExpr) <|>
            Chr("chr" ~> unOppExpr)) <|>
          Plus("+" ~> numericUnOppExpr).map(expr => expr)).label("unary operator")

    // Parser for expressions
    private lazy val expr: Parsley[Expr] =
        precedence(atom, "(" ~> expr <~ ")")(
            Ops(InfixL)(Mul <# "*".label("binary operator"), Div <# "/".label("binary operator"),
                Mod <# "%".label("binary operator")),
            Ops(InfixL)(Add <# "+".label("binary operator"), Sub <# "-".label("binary operator")),
            Ops(InfixN)(GTE <# ">=".label("binary operator"), GT <# ">".label("binary operator")
                , LTE <# "<=".label("binary operator"), LT <# "<".label("binary operator")),
            Ops(InfixN)(Eq <# "==".label("binary operator"), NEq <# "!=".label("binary operator")),
            Ops(InfixR)(And <# "&&".label("binary operator")),
            Ops(InfixR)(Or <# "||".label("binary operator"))
        )

    // Parser for unary expression
    private lazy val unOppExpr: Parsley[Expr] = atom <|> ("(" ~> expr <~ ")")

    // Parser for numeric unary expressions
    private lazy val numericUnOppExpr: Parsley[Expr] = IntLit(integers) | unOpp

    // Parser for atomic expressions
    private lazy val atom: Parsley[Expr] =
        atomic(arrayElem) | Ident(identifier) | IntLit(integers) |
          BoolLit(boolLiterals) | CharLit(charLiterals) | StrLit(stringLiterals) | unOpp |
          (PairLiter <# "null")

    // Parser for lvalues
    private lazy val lvalue: Parsley[LValue] =
        atomic(arrayElem) | atomic(pairElem) | Ident(identifier)

    // Parser for rvalues
    private lazy val rvalue: Parsley[RValue] =
        atomic(expr) | Call("call" ~> ident, "(" ~> sepBy(expr, ",") <~ ")") | arrayLit |
          NewPair("newpair" ~> "(" ~> expr, "," ~> expr <~ ")") | pairElem

    // Parser for array literals
    private lazy val arrayLit: Parsley[ArrayLit] =
        ArrayLit("[" ~> sepBy(expr, ",") <~ "]").label("array literal")

    // Parser for array elements
    private lazy val arrayElem: Parsley[ArrayElem] =
        ArrayElem(Ident(identifier), some("[" ~> expr <~ "]")).label("array element")

    // Parser for pair elements
    private lazy val pairElem: Parsley[PairElem] =
        PairFst("fst" ~> lvalue) | PairSnd("snd" ~> lvalue).label("pair element")

    // Function to check if a function exits
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
