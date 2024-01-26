import javax.management.relation.InvalidRoleValueException

object ast {
    case class Prog(funcs: List[Func], stmt: Stmt)(pos: (Int, Int))
    case class Func(typ: Type, ident: Ident, paramList: ParamList, stmt: Stmt)(pos: (Int, Int))
    case class ParamList(params: List[Param])(pos: (Int, Int))
    case class Param(typ: Type, ident: Ident)(pos: (Int, Int))

    // Statements
    sealed trait Stmt
    case class Skip()(pos: (Int, Int))
    case class Declaration(typ: Type, x: Ident, y: RValue)(pos: (Int, Int))
    case class Assign(lValue: LValue, y: RValue)(pos: (Int, Int))
    case class Read(lValue: LValue)(pos: (Int, Int))
    case class Free(expr: Expr)(pos: (Int, Int))
    case class Return(expr: Expr)(pos: (Int, Int))
    case class Exit(expr: Expr)(pos: (Int, Int))
    case class Print(expr: Expr)(pos: (Int, Int))
    case class Println(expr: Expr)(pos: (Int, Int))
    case class IfStmt(cond: Expr, thenStmt: Stmt, elseStmt: Stmt)(pos: (Int, Int))
    case class WhileStmt(cond: Expr, doStmt: Stmt)(pos: (Int, Int))
    case class Begin(beginStmt: Stmt)(pos: (Int, Int))
    case class Stmts(stmt1: Stmt, stmt2: Stmt)(pos: (Int, Int))

    sealed trait LValue
    sealed trait Expr extends LValue
    case class Ident(name: String) (pos: (Int, Int)) extends LValue with Expr
    case class ArrayElem(ident: Ident, xs: List[Expr])(pos: (Int, Int)) extends LValue with Expr
 

    sealed trait RValue
    case class NewPair(fst: Expr, snd: Expr)(pos: (Int, Int))
    case class Call(x: Ident, args: ArgList)(pos: (Int, Int))
    case class FunctionCall(ident: Ident, args: List[ArgList])(pos: (Int, Int))

    case class ArgList(args: List[Expr])(pos: (Int, Int))

    sealed trait PairElem extends LValue with InvalidRoleValueException
    case class PairFst(lValue: LValue)(pos: (Int, Int))
    case class PairSnd(lValue: LValue)(pos: (Int, Int))

    case class ArrayLit(xs: List[Expr])(pos: (Int, Int)) extends RValue

    // Types
    sealed trait Type
    sealed trait BaseType extends Type with PairElemType
    sealed trait PairElemType
    case class Pair()(pos: (Int, Int)) extends PairElemType
    case class ArrayType(typ: Type)(pos: (Int, Int)) extends Type with PairElemType
    case class IntType()(pos: (Int, Int)) extends BaseType
    case class BoolType()(pos: (Int, Int)) extends BaseType
    case class CharType()(pos: (Int, Int)) extends BaseType
    case class StringType()(pos: (Int, Int)) extends BaseType
    case class PairType(fstType: PairElemType, sndType: PairElemType)(pos: (Int, Int)) extends Type
    case class Fst(x: Expr)(pos: (Int, Int)) extends PairElem
    case class Snd(x: Expr)(pos: (Int, Int)) extends PairElem

    /* Binary Operators */
    case class Add(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class Sub(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class Mul(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class Div(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class GT(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class GTE(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class LT(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class LTE(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class Eq(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class NEq(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class And(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr
    case class Or(x: Expr, y: Expr)(pos: (Int, Int)) extends Expr

    /* Unary Operators */
    case class Not(v: Expr)(pos: (Int, Int)) extends Expr
    case class Neg(x: Expr)(pos: (Int, Int)) extends Expr
    case class Len(v: Expr)(pos: (Int, Int)) extends Expr
    case class Ord(v: Expr)(pos: (Int, Int)) extends Expr
    case class Chr(x: Expr)(pos: (Int, Int)) extends Expr

    /* Literals */
    case class IntLit(x: BigInt)(pos: (Int, Int)) extends Expr
    case class Ident(v: String)(pos: (Int, Int)) extends Expr
    case class BoolLit(b: Boolean)(pos: (Int, Int)) extends Expr
    case class CharLit(c: Char)(pos: (Int, Int)) extends Expr
    case class StrLit(s: String)(pos: (Int, Int)) extends Expr
    case class PairLiter()(pos: (Int, Int)) extends Expr

}

