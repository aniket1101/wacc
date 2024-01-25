case class Prog(x: Expr)

sealed trait Expr

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

/* Types */
case class IntLit(x: BigInt) extends Expr
case class Ident(v: String) extends Expr
case class BoolLit(b: Boolean) extends Expr
case class CharLit(c: Char) extends Expr
case class StrLit(s: String) extends Expr