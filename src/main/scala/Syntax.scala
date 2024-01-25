case class Prog(decls: List[Asgn], x: Expr)
case class Asgn(v: String, x: Expr)

sealed trait Expr
case class Add(x: Expr, y: Expr) extends Expr
case class Mul(x: Expr, y: Expr) extends Expr
case class Val(x: BigInt) extends Expr
case class Var(v: String) extends Expr
