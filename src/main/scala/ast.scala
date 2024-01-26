object ast {
    case class Prog(funcs: List[Func], stmt: Stmt)
    case class Func(typ: Type, ident: Ident, paramList: List[Param], stmt: Stmt)
    case class Param(typ: Type, ident: Ident)

    // Statements
    sealed trait Stmt
    case class Skip()
    case class Declaration(typ: Type, x: Ident, y: RValue) extends Stmt
    case class Assign(lValue: LValue, y: RValue)
    case class Read(lValue: LValue)
    case class Free(expr: Expr)
    case class Return(expr: Expr)
    case class Exit(expr: Expr)
    case class Print(expr: Expr)
    case class Println(expr: Expr)
    case class IfStmt(cond: Expr, thenStmt: Stmt, elseStmt: Stmt)
    case class WhileStmt(cond: Expr, doStmt: Stmt)
    case class Begin(beginStmt: Stmt)
    case class Stmts(stmt1: Stmt, stmt2: Stmt)

    sealed trait LValue
    sealed trait Expr extends RValue
    case class Ident(name: String) extends LValue with Expr
    case class ArrayElem(ident: Ident, xs: List[Expr]) extends LValue with Expr


    sealed trait RValue
    case class NewPair(fst: Expr, snd: Expr)
    case class Call(x: Ident, args: ArgList)
    case class FunctionCall(ident: Ident, args: List[ArgList])

    case class ArgList(args: List[Expr])

    sealed trait PairElem extends LValue
    case class PairFst(lValue: LValue)
    case class PairSnd(lValue: LValue)

    case class ArrayLit(xs: List[Expr]) extends RValue

    // Types
    sealed trait Type
    sealed trait BaseType extends Type with PairElemType
    sealed trait PairElemType
    case class Pair() extends PairElemType
    case class ArrayType(typ: Type) extends Type with PairElemType
    case class IntType() extends BaseType
    case class BoolType() extends BaseType
    case class CharType() extends BaseType
    case class StringType() extends BaseType
    case class PairType(fstType: PairElemType, sndType: PairElemType) extends Type
    case class Fst(x: Expr) extends PairElem
    case class Snd(x: Expr) extends PairElem

    /* Binary Operators */
    case class Add(x: Expr, y: Expr) extends Expr
    case class Sub(x: Expr, y: Expr) extends Expr
    case class Mul(x: Expr, y: Expr) extends Expr
    case class Div(x: Expr, y: Expr) extends Expr
    case class GT(x: Expr, y: Expr) extends Expr
    case class GTE(x: Expr, y: Expr) extends Expr
    case class LT(x: Expr, y: Expr) extends Expr
    case class LTE(x: Expr, y: Expr) extends Expr
    case class Eq(x: Expr, y: Expr) extends Expr
    case class NEq(x: Expr, y: Expr) extends Expr
    case class And(x: Expr, y: Expr) extends Expr
    case class Or(x: Expr, y: Expr) extends Expr

    /* Unary Operators */
    case class Not(v: Expr) extends Expr
    case class Neg(x: Expr) extends Expr
    case class Len(v: Expr) extends Expr
    case class Ord(v: Expr) extends Expr
    case class Chr(x: Expr) extends Expr

    /* Literals */
    case class IntLit(x: BigInt) extends Expr
    case class BoolLit(b: Boolean) extends Expr
    case class CharLit(c: Char) extends Expr
    case class StrLit(s: String) extends Expr
    case class PairLiter() extends Expr

}


