object types {
  case class Prog(funcs: List[Func], stmt: Stmt)
  case class Func(typ: Type, ident: Ident, paramList: List[Param], stmt: Stmt)
  case class Param(typ: Type, ident: Ident)

  // Statements
  sealed trait Stmt
  case class Skip() extends Stmt
  case class Declaration(typ: Type, x: Ident, y: RValue) extends Stmt
  case class Assign(lValue: LValue, y: RValue) extends Stmt
  case class Read(lValue: LValue) extends Stmt
  case class Free(expr: Expr) extends Stmt
  case class Return(expr: Expr) extends Stmt
  case class Exit(expr: Expr) extends Stmt
  case class Print(expr: Expr) extends Stmt
  case class Println(expr: Expr) extends Stmt
  case class IfStmt(cond: Expr, thenStmt: Stmt, elseStmt: Stmt) extends Stmt
  case class WhileStmt(cond: Expr, doStmt: Stmt) extends Stmt
  case class Begin(beginStmt: Stmt) extends Stmt
  case class Stmts(stmt1: Stmt, stmt2: Stmt) extends Stmt

  sealed trait LValue
  sealed trait Expr extends RValue
  sealed trait BinOpp extends Expr
  sealed trait UnOpp extends Expr
  sealed trait Atom extends Expr
  case class Ident(name: String) extends LValue with Atom
  case class ArrayElem(ident: Ident, xs: List[Expr]) extends LValue with Atom


  sealed trait RValue
  case class NewPair(fst: Expr, snd: Expr) extends RValue
  case class Call(x: Ident, args: ArgList) extends RValue

  case class ArgList(args: List[Expr])

  sealed trait PairElem extends LValue with RValue
  case class PairFst(lValue: LValue) extends PairElem
  case class PairSnd(lValue: LValue) extends PairElem

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

  /* Binary Operators */
  case class Add(x: Expr, y: Expr) extends BinOpp
  case class Sub(x: Expr, y: Expr) extends BinOpp
  case class Mul(x: Expr, y: Expr) extends BinOpp
  case class Div(x: Expr, y: Expr) extends BinOpp
  case class Mod(x: Expr, y: Expr) extends BinOpp
  case class GT(x: Expr, y: Expr) extends BinOpp
  case class GTE(x: Expr, y: Expr) extends BinOpp
  case class LT(x: Expr, y: Expr) extends BinOpp
  case class LTE(x: Expr, y: Expr) extends BinOpp
  case class Eq(x: Expr, y: Expr) extends BinOpp
  case class NEq(x: Expr, y: Expr) extends BinOpp
  case class And(x: Expr, y: Expr) extends BinOpp
  case class Or(x: Expr, y: Expr) extends BinOpp

  /* Unary Operators */
  case class Not(v: Expr) extends UnOpp
  case class Neg(x: Expr) extends UnOpp
  case class Len(v: Expr) extends UnOpp
  case class Ord(v: Expr) extends UnOpp
  case class Chr(x: Expr) extends UnOpp

  /* Literals */
  case class IntLit(x: BigInt) extends Atom
  case class BoolLit(b: Boolean) extends Atom
  case class CharLit(c: Char) extends Atom
  case class StrLit(s: String) extends Atom
  case class PairLiter() extends Atom

}

