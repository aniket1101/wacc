import parsley.Parsley
import parsley.position.pos
import parsley.syntax.zipped.Zipped2
import parsley.syntax.zipped.Zipped3
import parserTools.SymbolTable

object ast {

    // Bridge between singleton and parser
    trait ParserSingletonBridgePos[+A] {
        def con(pos: (Int, Int)): A
        def <#(op: Parsley[_]): Parsley[A] = pos.map(this.con(_)) <* op
    }

    // Bridge with no arguments
    trait ParserBridgePos0[A] extends ParserSingletonBridgePos[A] {
        override final def con(pos: (Int, Int)): A = this.apply()(pos)

        def apply()(pos: (Int, Int)): A
    }

    // Bridge with 1 argument
    trait ParserBridgePos1[-A, +B] extends ParserSingletonBridgePos[A => B] {
        override final def con(pos: (Int, Int)): A => B = this.apply(_)(pos)

        def apply(x: A)(pos: (Int, Int)): B

        def apply(x: Parsley[A]): Parsley[B] = pos <**> x.map(this.apply(_) _)
    }

    // Bridge with 2 arguments
    trait ParserBridgePos2[-A, -B, +C] extends ParserSingletonBridgePos[(A, B) => C] {
        def apply(x: A, y: B)(pos: (Int, Int)): C

        def apply(x: Parsley[A], y: Parsley[B]): Parsley[C] = {
            pos <**> (x, y).zipped(this.apply(_, _) _)
        }

        def con(pos: (Int, Int)): (A, B) => C = this.apply(_, _)(pos)
    }

    // Bridge with 3 arguments
    trait ParserBridgePos3[-A, -B, -C, +D] extends ParserSingletonBridgePos[(A, B, C) => D] {
        override final def con(pos: (Int, Int)): (A, B, C) => D =
            this.apply(_, _, _)(pos)

        def apply(x: A, y: B, z: C)(pos: (Int, Int)): D

        def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C]): Parsley[D] =
            pos <**> (x, y, z).zipped(this.apply(_, _, _) _)
    }

    class root() {
        var sTbl: SymbolTable = null

        def addSt(st: SymbolTable): Unit = {
            sTbl = st
        }
    }

    case class Prog(funcs: List[Func],  stats: Stats)(val pos: (Int, Int)) extends root {
        override def toString: String = {
            var output: String = null
            for (f <- funcs) {
                output += f.toString
            }
            output + stats.toString
        }
    }

    case class Func(ident: TypeIdent, params: List[Param], stats: Stats)(val pos: (Int, Int)) extends root {
        override def toString: String = {
            var output = ident.toString + "("
            for (param <- params) {
                output += param.toString + ","
            }
            output + "):\n" + stats.toString + "funcEnd"
        }
    }

    // Statements
    sealed trait Stat
    case class Stats(stats: List[Stat])(pos: (Int, Int)) {
        override def toString: String = {
            var output: String = ""
            for (s <- stats) {
                output += s.toString + ";\n"
            }
            output
        }
    }

    case class Skip()(val pos: (Int, Int)) extends Stat {
        override def toString: String = "skip(" + pos.toString() + ")"
    }

    case class Read(lvalue: LValue)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "read(" + lvalue.toString + ")"
    }

    case class Free(expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "free(" + expr.toString + ")"
    }

    case class Return(expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "return(" + expr.toString + ")"
    }

    case class Exit(expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "exit(" + expr.toString + ")"
    }

    case class Print(expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "print(" + expr.toString + ")"
    }

    case class Println(expr: Expr)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "println(" + expr.toString + ")"
    }

    case class If(cond: Expr, ifStats: Stats, elseStats: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "if " + cond.toString + " then \n" +
          ifStats.toString + " else \n" + elseStats.toString + " fi"
    }

    case class While(cond: Expr, body: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "while " + cond + " do \n" + body.toString + " done"
    }

    case class Scope(xs: Stats)(val pos: (Int, Int)) extends Stat {
        override def toString: String = "{" + xs.toString + "}"
    }

    sealed trait Type extends root

    sealed trait PairElemType extends Type

    case class PairT(expr1: PairElemType, expr2: PairElemType)(val pos: (Int, Int)) extends Type {
        override def toString: String = "Pair(" +
                                                  expr1.toString + "," +
                                                  expr2.toString + ")" +
                                                  "(" + pos.toString() +
                                        ")"
    }

    sealed trait Type1 extends PairElemType with Type

    case class ArrayType(typ: Type)(val pos: (Int, Int)) extends Type1 {
        override def toString: String = typ.toString + "[]"
    }

    case class PairType()(val pos: (Int, Int)) extends PairElemType {
        override def toString: String = "PAIR"
    }

    sealed trait BaseType extends Type1

    case class IntType()(val pos: (Int, Int)) extends BaseType {
        override def toString: String = "INT"
    }

    case class BoolType()(val pos: (Int, Int)) extends BaseType {
        override def toString: String = "BOOL"
    }

    case class CharType()(val pos: (Int, Int)) extends BaseType {
        override def toString: String = "CHAR"
    }

    case class StringType()(val pos: (Int, Int)) extends BaseType {
        override def toString: String = "STRING"
    }

    sealed trait LValue extends root

    case class TypeIdent(typ: Type, ident: Ident)(val pos: (Int, Int)) extends LValue {
        override def toString: String = typ.toString + " " + ident.toString
    }

    case class Param(typeIdent: TypeIdent)(val pos: (Int, Int)) extends root {
        override def toString: String = "param(" + typeIdent.toString + ")"
    }

    case class Declaration(typeIdent: TypeIdent, rVal: RValue)(val pos: (Int, Int)) extends Stat {
        override def toString: String = typeIdent.toString + ":=" + rVal.toString
    }

    case class Assign(lVal: LValue, rVal: RValue)(val pos: (Int, Int)) extends Stat {
        override def toString: String = lVal.toString + ":=" + rVal.toString
    }

    sealed trait RValue extends root

    case class ArrayLiteral(exprs: List[Expr])(val pos: (Int, Int)) extends RValue {
        override def toString: String = {
            var output = "["
            for (expr <- exprs) {
                output += expr.toString + ","
            }
            output + "]"
        }
    }

    case class ArgList(exprs: List[Expr])(val pos: (Int, Int)) extends RValue {
        override def toString: String = {
            var output = "("
            for (expr <- exprs) {
                output += expr.toString + ","
            }
            output + ")"
        }
    }

    case class NewPair(expr1: Expr, expr2: Expr)(val pos: (Int, Int)) extends RValue {
        override def toString: String = "newPair(" + expr1.toString + "," + expr2.toString + ")"
    }

    case class Call(ident: Ident, args: ArgList)(val pos: (Int, Int)) extends RValue {
        override def toString: String = "call:" + ident.toString + args.toString
    }

    sealed trait PairElem extends LValue with RValue

    case class PairElemFst(lVal: LValue)(val pos: (Int, Int)) extends PairElem {
        override def toString: String = "fst(" + lVal.toString + ")"
    }

    case class PairElemSnd(lVal: LValue)(val pos: (Int, Int)) extends PairElem {
        override def toString: String = "snd(" + lVal.toString + ")"
    }

    sealed trait Expr extends RValue

    sealed trait IntExpr extends root
    sealed trait StringExpr extends root
    sealed trait BoolExpr extends root
    sealed trait CharExpr extends root
    sealed trait PairExpr extends root
    sealed trait ArrayExpr extends root

    /* Literals */
    case class IntLiteral(num: Int)(val pos: (Int, Int)) extends Expr with IntExpr {
        override def toString(): String = num.toString
    }

    case class BoolLiteral(bool: Boolean)(val pos: (Int, Int)) extends Expr with BoolExpr {
        override def toString: String = bool.toString
    }

    case class CharLiteral(ch: Char)(val pos: (Int, Int)) extends Expr with CharExpr {
        override def toString: String = "'" + ch + "'"
    }

    case class StrLiteral(str: String)(val pos: (Int, Int)) extends Expr with StringExpr {
        override def toString: String = str
    }

    case class PairLiteral()(val pos: (Int, Int)) extends Expr with PairExpr {
        override def toString: String = "null"
    }

    sealed trait identType extends LValue with Expr

    case class Ident(name: String)(val pos: (Int, Int)) extends identType {
        override def toString: String = name
    }

    case class ArrayElem(id: Ident, expr: List[Expr])(val pos: (Int, Int)) extends identType {
        override def toString: String = {
            var output = id.toString()
            for (x <- expr) {
                output += "[" + x.toString + "]"
            }
            output
        }
    }

    /* Binary Operators */
    sealed class BinOpp(val expr1: Expr, val expr2: Expr)(val pos:(Int,Int)) extends Expr

    case class Add(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with IntExpr {
        override def toString: String = "(" + expr1.toString + "+" + expr2.toString + ")"
    }

    case class Sub(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with IntExpr {
        override def toString: String = "(" + expr1.toString + "-" + expr2.toString + ")"
    }

    case class Mul(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with IntExpr {
        override def toString: String = "(" + expr1.toString + "*" + expr2.toString + ")"
    }

    case class Div(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with IntExpr {
        override def toString: String = "(" + expr1.toString + "/" + expr2.toString + ")"
    }

    case class Mod(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with IntExpr {
        override def toString: String = "(" + expr1.toString + "%" + expr2.toString + ")"
    }

    case class GT(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + ">" + expr2.toString + ")"
    }

    case class GTE(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + ">=" + expr2.toString + ")"
    }

    case class LT(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + "<" + expr2.toString + ")"
    }

    case class LTE(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + "<=" + expr2.toString + ")"
    }

    case class Eq(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr { // Equals
        override def toString: String = "(" + expr1.toString + "==" + expr2.toString + ")"
    }

    case class NEq(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + "!=" + expr2.toString + ")"
    }

    case class And(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + "&&" + expr2.toString + ")"
    }

    case class Or(override val expr1: Expr, override val expr2: Expr)(override val pos: (Int, Int)) extends BinOpp(expr1, expr2)(pos) with BoolExpr {
        override def toString: String = "(" + expr1.toString + "||" + expr2.toString + ")"
    }

    /* Unary Operators */
    sealed trait UnOpp extends Expr

    case class Not(val expr: Expr)(val pos: (Int, Int)) extends UnOpp with BoolExpr {
        override def toString: String = "Not(" + expr.toString + ")"
    }
    case class Neg(val expr: Expr)(val pos: (Int, Int)) extends UnOpp with IntExpr {
        override def toString: String = "Neg(" + expr.toString + ")"
    }
    case class Len(val expr: Expr)(val pos: (Int, Int)) extends UnOpp with IntExpr {
        override def toString: String = "Len(" + expr.toString + ")"
    }
    case class Ord(val expr: Expr)(val pos: (Int, Int)) extends UnOpp with IntExpr {
        override def toString: String = "Ord(" + expr.toString + ")"
    }
    case class Chr(val expr: Expr)(val pos: (Int, Int)) extends UnOpp with CharExpr {
        override def toString: String = "Chr(" + expr.toString + ")"
    }

    object identType extends ParserBridgePos2[Ident, List[Expr], identType] {
        def apply(ident: Ident, exprs: List[Expr])(pos: (Int, Int)): identType = exprs match {
            case Nil => ident
            case exprs => ArrayElem(ident, exprs)(pos)
        }
    }
    object Prog extends ParserBridgePos2[List[Func], Stats, Prog]

    object Scope extends ParserBridgePos1[Stats, Scope]

    object Func extends ParserBridgePos3[TypeIdent, List[Param], Stats, Func]

    object Stats extends ParserBridgePos1[List[Stat], Stats]

    object Skip extends ParserBridgePos0[Skip]

    object PairType extends ParserBridgePos0[PairType]

    object IntType extends ParserBridgePos0[IntType]

    object BoolType extends ParserBridgePos0[BoolType]

    object CharType extends ParserBridgePos0[CharType]

    object StringType extends ParserBridgePos0[StringType]

    object PairLiteral extends ParserBridgePos0[PairLiteral]

    object Read extends ParserBridgePos1[LValue, Read]

    object Println extends ParserBridgePos1[Expr, Println]

    object Exit extends ParserBridgePos1[Expr, Exit]

    object Return extends ParserBridgePos1[Expr, Return]

    object Free extends ParserBridgePos1[Expr, Free]

    object If extends ParserBridgePos3[Expr, Stats, Stats, If]

    object While extends ParserBridgePos2[Expr, Stats, While]

    object Print extends ParserBridgePos1[Expr, Print]

    object Param extends ParserBridgePos1[TypeIdent, Param]

    object TypeIdent extends ParserBridgePos2[Type, Ident, TypeIdent]

    object Declaration extends ParserBridgePos2[TypeIdent, RValue, Declaration]

    object Assign extends ParserBridgePos2[LValue, RValue, Assign]
    object PairT extends ParserBridgePos2[PairElemType, PairElemType, PairT]
    object ArrayType extends ParserBridgePos1[Type, ArrayType]
    object Call extends ParserBridgePos2[Ident, ArgList, Call]
    object NewPair extends ParserBridgePos2[Expr, Expr, NewPair]
    object ArgList extends ParserBridgePos1[List[Expr], ArgList]
    object ArrayLiteral extends ParserBridgePos1[List[Expr], ArrayLiteral]
    object PairElemFst extends ParserBridgePos1[LValue, PairElemFst]
    object PairElemSnd extends ParserBridgePos1[LValue, PairElemSnd]
    object ArrayElem extends ParserBridgePos2[Ident, List[Expr], ArrayElem]
    object Ident extends ParserBridgePos1[String, Ident]
    object IntLiteral extends ParserBridgePos1[Int, IntLiteral]
    object BoolLiteral extends ParserBridgePos1[Boolean, BoolLiteral]
    object CharLiteral extends ParserBridgePos1[Char, CharLiteral]
    object StrLiteral extends ParserBridgePos1[String, StrLiteral]

    /* Binary Operators */
    object Not extends ParserBridgePos1[Expr, Not]
    object Neg extends ParserBridgePos1[Expr, Neg]
    object Len extends ParserBridgePos1[Expr, Len]
    object Ord extends ParserBridgePos1[Expr, Ord]
    object Chr extends ParserBridgePos1[Expr, Chr]
    object Add extends ParserBridgePos2[Expr, Expr, Add]
    object Sub extends ParserBridgePos2[Expr, Expr, Sub]
    object Mul extends ParserBridgePos2[Expr, Expr, Mul]
    object Div extends ParserBridgePos2[Expr, Expr, Div]
    object Mod extends ParserBridgePos2[Expr, Expr, Mod]
    object GT extends ParserBridgePos2[Expr, Expr, GT]
    object GTE extends ParserBridgePos2[Expr, Expr, GTE]
    object LT extends ParserBridgePos2[Expr, Expr, LT]
    object LTE extends ParserBridgePos2[Expr, Expr, LTE]
    object Eq extends ParserBridgePos2[Expr, Expr, Eq]
    object NEq extends ParserBridgePos2[Expr, Expr, NEq]
    object And extends ParserBridgePos2[Expr, Expr, And]
    object Or extends ParserBridgePos2[Expr, Expr, Or]




}

