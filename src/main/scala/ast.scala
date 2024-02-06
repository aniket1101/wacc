import parsley.Parsley
import parsley.position.pos
import parsley.syntax.zipped.Zipped2
import parsley.syntax.zipped.Zipped3
import parsley.syntax.zipped.Zipped4

object ast {

  // Bridge between singleton and parser
  trait ParserSingletonBridgePos[+A] {
    def con(pos: (Int, Int)): A
    def <#(op: Parsley[_]): Parsley[A] = pos.map(this.con) <* op
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

    def apply(x: Parsley[A]): Parsley[B] = pos <**> x.map(this.apply)
  }

  // Bridge with 2 arguments
  trait ParserBridgePos2[-A, -B, +C] extends ParserSingletonBridgePos[(A, B) => C] {
    def apply(x: A, y: B)(pos: (Int, Int)): C

    def apply(x: Parsley[A], y: Parsley[B]): Parsley[C] =
      pos <**> (x, y).zipped(this.apply)

    def con(pos: (Int, Int)): (A, B) => C = this.apply(_, _)(pos)
  }

  // Bridge with 3 arguments
  trait ParserBridgePos3[-A, -B, -C, +D] extends ParserSingletonBridgePos[(A, B, C) => D] {
    override final def con(pos: (Int, Int)): (A, B, C) => D =
      this.apply(_, _, _)(pos)

    def apply(x: A, y: B, z: C)(pos: (Int, Int)): D

    def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C]): Parsley[D] =
      pos <**> (x, y, z).zipped(this.apply)
  }

  trait ParserBridgePos4[-A, -B, -C, -D, +E] extends ParserSingletonBridgePos[(A, B, C, D) => E] {
    override final def con(pos: (Int, Int)): (A, B, C, D) => E =
      this.apply(_, _, _, _)(pos)

    def apply(x: A, y: B, z: C, w: D)(pos: (Int, Int)): E

    def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C], w: => Parsley[D]): Parsley[E] =
      pos <**> (x, y, z, w).zipped(this.apply)
  }

  // Positioning
  trait Position {
    val pos: (Int, Int)
  }

  case class Prog(funcs: List[Func], stats: List[Stat])(val pos: (Int, Int)) extends Position
  case class Func(typ: Type, ident: Ident, paramList: List[Param], stats: List[Stat])(val pos: (Int, Int)) extends Position
  case class Param(typ: Type, ident: Ident)(val pos: (Int, Int)) extends Position

  // Statements
  sealed trait Stat extends Position
  case class Skip()(val pos: (Int, Int)) extends Stat
  case class Declaration(typ: Type, x: Ident, y: RValue)(val pos: (Int, Int)) extends Stat
  case class Assign(lValue: LValue, y: RValue)(val pos: (Int, Int)) extends Stat
  case class Read(lValue: LValue)(val pos: (Int, Int)) extends Stat
  case class Free(expr: Expr)(val pos: (Int, Int)) extends Stat
  case class Return(expr: Expr)(val pos: (Int, Int)) extends Stat
  case class Exit(expr: Expr)(val pos: (Int, Int)) extends Stat
  case class Print(expr: Expr)(val pos: (Int, Int)) extends Stat
  case class Println(expr: Expr)(val pos: (Int, Int)) extends Stat
  case class If(cond: Expr, thenStat: List[Stat], elseStat: List[Stat])(val pos: (Int, Int)) extends Stat
  case class While(cond: Expr, doStat: List[Stat])(val pos: (Int, Int)) extends Stat

  case class Scope(stats: List[Stat])(val pos: (Int, Int)) extends Stat

  sealed trait LRValue extends Position
  sealed trait LValue extends LRValue
  sealed trait Expr extends RValue with Position
  sealed class Atom(val pos:(Int,Int)) extends Expr
  case class Ident(name: String)(override val pos: (Int, Int)) extends Atom(pos) with LValue
  case class ArrayElem(ident: Ident, expr: Expr)(override val pos: (Int, Int)) extends Atom(pos) with LValue


  sealed trait RValue extends LRValue
  case class NewPair(fst: Expr, snd: Expr)(val pos: (Int, Int)) extends RValue
  case class Call(x: Ident, args: List[Expr])(val pos: (Int, Int)) extends RValue

  sealed trait PairElem extends LValue with RValue
  case class PairFst(lValue: LValue)(val pos: (Int, Int)) extends PairElem
  case class PairSnd(lValue: LValue)(val pos: (Int, Int)) extends PairElem

  case class ArrayLit(xs: List[Expr])(val pos: (Int, Int)) extends RValue

  // Special Cases for Semantic Analysis
  case object NoTypeExists extends Type with PairElemType {
    override val pos: (Int, Int) = (-1, -1)
  }

  case object AnyType extends Type with PairElemType {
    override val pos: (Int, Int) = (-1, -1)
  }

  // Types
  sealed trait Type extends Position
  sealed trait BaseType extends Type with PairElemType
  sealed trait PairElemType extends Type
  case class Pair()(val pos: (Int, Int)) extends PairElemType
  case class ArrayType(typ: Type)(val pos: (Int, Int)) extends Type with PairElemType
  case class IntType()(val pos: (Int, Int)) extends BaseType
  case class BoolType()(val pos: (Int, Int)) extends BaseType
  case class CharType()(val pos: (Int, Int)) extends BaseType
  case class StringType()(val pos: (Int, Int)) extends BaseType
  case class PairType(fstType: PairElemType, sndType: PairElemType)(val pos: (Int, Int)) extends Type

  /* Binary Operators */
  sealed class BinOpp(val x: Expr, val y: Expr)(val pos:(Int,Int)) extends Expr

  case class Sub(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Add(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Mul(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Div(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Mod(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class GT(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class GTE(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class LT(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class LTE(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Eq(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class NEq(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class And(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)
  case class Or(override val x: Expr, override val y: Expr)(override val pos: (Int, Int)) extends BinOpp(x, y)(pos)

  /* Unary Operators */
  sealed class UnOpp(val x: Expr)(val pos:(Int,Int)) extends Expr

  case class Not(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)
  case class Neg(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)
  case class Len(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)
  case class Ord(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)
  case class Chr(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)
  case class Plus(override val x: Expr)(override val pos: (Int, Int)) extends UnOpp(x)(pos)

  /* Literals */
  case class IntLit(x: Int)(override val pos: (Int, Int)) extends Atom(pos)
  case class BoolLit(b: Boolean)(override val pos: (Int, Int)) extends Atom(pos)
  case class CharLit(c: Char)(override val pos: (Int, Int)) extends Atom(pos)
  case class StrLit(s: String)(override val pos: (Int, Int)) extends Atom(pos)
  case class PairLiter()(override val pos: (Int, Int)) extends Atom(pos)

  /* PARSER BRIDGE CONNECTIONS */

  /* Core */
  object Prog extends ParserBridgePos2[List[Func], List[Stat], Prog]
  object Func extends ParserBridgePos4[Type, Ident, List[Param], List[Stat], Func]
  object Param extends ParserBridgePos2[Type, Ident, Param]

  /* Statements */
  object Skip extends ParserBridgePos0[Skip]
  object Declaration extends ParserBridgePos3[Type, Ident, RValue, Declaration]
  object Assign extends ParserBridgePos2[LValue, RValue, Assign]
  object Read extends ParserBridgePos1[LValue, Read]
  object Free extends ParserBridgePos1[Expr, Free]
  object Return extends ParserBridgePos1[Expr, Return]
  object Exit extends ParserBridgePos1[Expr, Exit]
  object Print extends ParserBridgePos1[Expr, Print]
  object Println extends ParserBridgePos1[Expr, Println]
  object If extends ParserBridgePos3[Expr, List[Stat], List[Stat], If]
  object While extends ParserBridgePos2[Expr, List[Stat], While]
  object Scope extends ParserBridgePos1[List[Stat], Scope]

  /* Base Types */
  object IntType extends ParserBridgePos0[IntType]
  object BoolType extends ParserBridgePos0[BoolType]
  object CharType extends ParserBridgePos0[CharType]
  object StringType extends ParserBridgePos0[StringType]

  /* Array Type */
  object ArrayType extends ParserBridgePos1[Type, ArrayType]

  /* Pair */
  object Pair extends ParserBridgePos0[Pair]
  object PairType extends ParserBridgePos2[PairElemType, PairElemType, PairType]

  /* RValues */
  object ArrayLit extends ParserBridgePos1[List[Expr], ArrayLit]
  object NewPair extends ParserBridgePos2[Expr, Expr, NewPair]
  object Call extends ParserBridgePos2[Ident, List[Expr], Call]

  /* Pair-Elem */
  object PairFst extends ParserBridgePos1[LValue, PairFst]
  object PairSnd extends ParserBridgePos1[LValue, PairSnd]

  /* Atoms */
  object ArrayElem extends ParserBridgePos2[Ident, Expr, ArrayElem]
  object Ident extends ParserBridgePos1[String, Ident]
  object IntLit extends ParserBridgePos1[Int, IntLit]
  object BoolLit extends ParserBridgePos1[Boolean, BoolLit]
  object CharLit extends ParserBridgePos1[Char, CharLit]
  object StrLit extends ParserBridgePos1[String, StrLit]
  object PairLiter extends ParserBridgePos0[PairLiter]

  /* Unary Operators */
  object Not extends ParserBridgePos1[Expr, Not]
  object Neg extends ParserBridgePos1[Expr, Neg]
  object Len extends ParserBridgePos1[Expr, Len]
  object Ord extends ParserBridgePos1[Expr, Ord]
  object Chr extends ParserBridgePos1[Expr, Chr]
  object Plus extends ParserBridgePos1[Expr, Plus]

  /* Binary Operators */
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


