import parsley.Parsley
import parsley.position._
import parsley.syntax.zipped.{Zipped2, Zipped3, Zipped4}
import parserTools.SymbolTable

object ast {

    // Bridge between singleton and parser
    trait ParserSingletonBridgePos[+A] {
        def con(pos: (Int, Int)): A

        def from(op: Parsley[_]): Parsley[A] = pos.map(this.con(_)) <* op

        final def <#(op: Parsley[_]): Parsley[A] = this from op
    }

    // Bridge with no arguments
    trait ParserBridgePos0[R] extends ParserSingletonBridgePos[R] {
        override final def con(pos: (Int, Int)): R = this.apply()(pos)

        def apply()(pos: (Int, Int)): R
    }

    // Bridge with 1 argument
    trait ParserBridgePos1[-A, +B] extends ParserSingletonBridgePos[A => B] {
        override final def con(pos: (Int, Int)): A => B = this.apply(_)(pos)

        def apply(x: A)(pos: (Int, Int)): B

        def apply(x: Parsley[A]): Parsley[B] = pos <**> x.map(this.apply(_) _)
    }

    // Bridge with 2 arguments
    trait ParserBridgePos2[-A, -B, +C] extends ParserSingletonBridgePos[(A, B) => C] {
        override final def con(pos: (Int, Int)): (A, B) => C = this.apply(_, _)(pos)

        def apply(x: A, y: B)(pos: (Int, Int)): C

        def apply(x: Parsley[A], y: => Parsley[B]): Parsley[C] =
            pos <**> (x, y).zipped(this.apply(_, _) _)
    }

    // Bridge with 3 arguments
    trait ParserBridgePos3[-A, -B, -C, +D] extends ParserSingletonBridgePos[(A, B, C) => D] {
        override final def con(pos: (Int, Int)): (A, B, C) => D =
            this.apply(_, _, _)(pos)

        def apply(x: A, y: B, z: C)(pos: (Int, Int)): D

        def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C]): Parsley[D] =
            pos <**> (x, y, z).zipped(this.apply(_, _, _) _)
    }

    class node() {
        var sTbl: SymbolTable = null

        def addSt(st: SymbolTable): Unit = {
            sTbl = st
        }
    }

    case class Prog(val funcs: List[Func], val stats: Stats)(pos: (Int, Int)) extends node {
        override def toString: String = {
            var output: String = null
            for (f <- funcs) {
                output += f.toString
            }
            output + stats.toString
        }
    }

    case class Func(val ident: TypeIdent, val params: List[Param], val stats: Stats)(val pos: (Int, Int)) extends node {
        override def toString: String = {
            var output = ident.toString + "("
            for (param <- params) {
                output += param.toString + ","
            }
            output + "):\n" + stats.toString + "funcEnd"
        }
    }

    sealed trait Stat
    case class Stats(val stats: List[Stat])(pos: (Int, Int)) {
        override def toString: String = {
            var out: String = ""
            for (s <- stats) {
                out += s.toString + ";\n"
            }
            out
        }
    }

    case class Skip()(val pos: (Int, Int)) extends Stat {
        override def toString: String = "skip(" + pos.toString() + ")"
    }

    case class Read(val lvalue: LValue)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "read(" + lvalue.toString + ")"
    }

    case class Println(val expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "println(" + expr.toString + ")"
    }

    case class Exit(val expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "exit(" + expr.toString + ")"
    }

    case class Return(val expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "return(" + expr.toString + ")"
    }

    case class Free(val expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "free(" + expr.toString + ")"
    }

    case class If(val cond: Expr, val ifStats: Stats, val elseStats: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "if " + cond.toString + " then \n" +
          ifStats.toString + " else \n" + elseStats.toString + " fi"
    }

    case class While(val cond: Expr, val body: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "while " + cond + " do \n" + body.toString + " done"
    }

    case class Print(val expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "print(" + expr.toString + ")"
    }

    case class Scope(val xs: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "{" + xs.toString + "}"
    }

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

    sealed trait PairElem extends LValue with RValue
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
    case class BoolLit(b: Boolean)(pos: (Int, Int)) extends Expr
    case class CharLit(c: Char)(pos: (Int, Int)) extends Expr
    case class StrLit(s: String)(pos: (Int, Int)) extends Expr
    case class PairLiter()(pos: (Int, Int)) extends Expr

}

