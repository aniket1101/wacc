package frontend

import parsley.ap._
import parsley.errors.combinator._
import parsley.{Parsley, generic}
import parsley.position.pos

object ast {

  // Bridge between singleton and parser
  trait ParserSingletonBridgePos[+A] extends generic.ErrorBridge {
    def con(pos: (Int, Int)): A
    def from(op: Parsley[_]): Parsley[A] = error(pos.map(this.con) <* op)
    final def <#(op: Parsley[_]): Parsley[A] = this from op
  }

  // Bridge with no arguments
  trait ParserBridgePos0[A] extends ParserSingletonBridgePos[A] {
    override final def con(pos: (Int, Int)): A = this.apply()(pos)

    def apply()(pos: (Int, Int)): A
  }

  // Bridge with 1 argument
  trait ParserBridgePos1[-A, +B] extends ParserSingletonBridgePos[A => B] {
    def apply(x: A)(pos: (Int, Int)): B

    def apply(x: Parsley[A]): Parsley[B] = error(ap1(pos.map(con), x))

    override final def con(pos: (Int, Int)): A => B = this.apply(_)(pos)
  }

  // Bridge with 2 arguments
  trait ParserBridgePos2[-A, -B, +C] extends ParserSingletonBridgePos[(A, B) => C] {
    def apply(x: A, y: B)(pos: (Int, Int)): C

    def apply(x: Parsley[A], y: => Parsley[B]): Parsley[C] = error(ap2(pos.map(con), x, y))

    override final def con(pos: (Int, Int)): (A, B) => C = this.apply(_, _)(pos)
  }

  // Bridge with 3 arguments
  trait ParserBridgePos3[-A, -B, -C, +D] extends ParserSingletonBridgePos[(A, B, C) => D] {
    override final def con(pos: (Int, Int)): (A, B, C) => D =
      this.apply(_, _, _)(pos)

    def apply(x: A, y: B, z: C)(pos: (Int, Int)): D

    def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C]): Parsley[D] =
      error(ap3(pos.map(con), x, y, z))

  }

  trait ParserBridgePos4[-A, -B, -C, -D, +E] extends ParserSingletonBridgePos[(A, B, C, D) => E] {
    override final def con(pos: (Int, Int)): (A, B, C, D) => E =
      this.apply(_, _, _, _)(pos)

    def apply(x: A, y: B, z: C, w: D)(pos: (Int, Int)): E

    def apply(x: Parsley[A], y: => Parsley[B], z: => Parsley[C], w: => Parsley[D]): Parsley[E] =
      error(ap4(pos.map(con), x, y, z, w))
  }

  // Positioning
  trait Position {
    val pos: (Int, Int)
  }

  case class Prog(funcs: List[Func], stats: List[Stat])(val pos: (Int, Int)) extends Position
  case class Func(var typ: Option[Type], ident: Ident, paramList: List[Param], stats: List[Stat])(val pos: (Int, Int)) extends Position
  case class Param(var typ: Option[Type], ident: Ident)(val pos: (Int, Int)) extends Position

  // Statements
  sealed trait Stat extends Position
  case class Skip()(val pos: (Int, Int)) extends Stat
  case class Declaration(typ: Type, x: Ident, y: RValue)(val pos: (Int, Int)) extends Stat
  case class AssignorInferDecl(lValue: LValue, y: RValue)(val pos: (Int, Int)) extends Stat
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

  sealed trait IdentArray extends LValue with Expr
  case class Ident(name: String)(override val pos: (Int, Int)) extends IdentArray {
    override def toString: String = name
  }
  case class ArrayElem(ident: IdentArray, exprs: List[Expr])(override val pos: (Int, Int)) extends IdentArray


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
    override def toString:String = "<No Type>"
  }
  case object AnyType extends Type with PairElemType {
    override val pos: (Int, Int) = (-1, -1)
    override def toString:String = "<Unknown Type>"
  }

  case object NoType extends Type with PairElemType {
    override val pos: (Int, Int) = (-1, -1)
    override def toString: String = "<Type Not Inferred>"
  }

  // Type traits
  sealed trait Type extends Position
  sealed trait BaseType extends Type with PairElemType
  sealed trait PairElemType extends Type
  case class Pair()(val pos: (Int, Int)) extends PairElemType
  case class ArrayType(typ: Type)(val pos: (Int, Int)) extends Type with PairElemType {
    override def toString: String = s"<${typ.toString.replace("<", "").replace(">", "")}[]>"
  }
  case class IntType()(val pos: (Int, Int)) extends BaseType {
    override def toString: String = "<int>"
  }
  case class BoolType()(val pos: (Int, Int)) extends BaseType {
    override def toString: String = "<bool>"
  }
  case class CharType()(val pos: (Int, Int)) extends BaseType {
    override def toString: String = "<char>"
  }
  case class StringType()(val pos: (Int, Int)) extends BaseType {
    override def toString: String = "<string>"
  }
  case class PairType(fstType: PairElemType, sndType: PairElemType)(val pos: (Int, Int)) extends Type with PairElemType {
    override def toString: String = s"pair($fstType, $sndType)"
  }

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
  object Func extends ParserBridgePos4[Option[Type], Ident, List[Param], List[Stat], Func] {
    override def from(op: Parsley[_]): Parsley[(Option[Type], Ident, List[Param], List[Stat]) => Func] =
      super.from(op).label("function declaration")
  }
  object Param extends ParserBridgePos2[Option[Type], Ident, Param] {
    override def from(op: Parsley[_]): Parsley[(Option[Type], Ident) => Param] = super.from(op).label("parameter")
  }

  /* Statements */
  object Skip extends ParserBridgePos0[Skip]
  object Declaration extends ParserBridgePos3[Type, Ident, RValue, Declaration] {
    override def from(op: Parsley[_]): Parsley[(Type, Ident, RValue) => Declaration] =
      super.from(op).label("declaration")
  }
  object AssignorInferDecl extends ParserBridgePos2[LValue, RValue, AssignorInferDecl] {
    override def from(op: Parsley[_]): Parsley[(LValue, RValue) => AssignorInferDecl] = super.from(op).label("assignment or inferred declaration")
  }
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
  object PairType extends ParserBridgePos2[PairElemType, PairElemType, PairType] {
    override def from(op: Parsley[_]): Parsley[(PairElemType, PairElemType) => PairType] =
      super.from(op).label("pair element")
  }

  /* RValues */
  object ArrayLit extends ParserBridgePos1[List[Expr], ArrayLit] {
    override def from(op: Parsley[_]): Parsley[List[Expr] => ArrayLit] = super.from(op).label("array literal")
  }
  object NewPair extends ParserBridgePos2[Expr, Expr, NewPair]
  object Call extends ParserBridgePos2[Ident, List[Expr], Call]

  /* Pair-Elem */
  object PairFst extends ParserBridgePos1[LValue, PairFst]
  object PairSnd extends ParserBridgePos1[LValue, PairSnd]

  /* Atoms */
  object ArrayElem extends ParserBridgePos2[IdentArray, List[Expr], ArrayElem] {
    override def from(op: Parsley[_]): Parsley[(IdentArray, List[Expr]) => ArrayElem] =
      super.from(op).label("array element")
  }
  object Ident extends ParserBridgePos1[String, Ident] {
    override def from(op: Parsley[_]): Parsley[String => Ident] = super.from(op).label("identifier")
  }
  object IntLit extends ParserBridgePos1[Int, IntLit]
  object BoolLit extends ParserBridgePos1[Boolean, BoolLit]
  object CharLit extends ParserBridgePos1[Char, CharLit]
  object StrLit extends ParserBridgePos1[String, StrLit]
  object PairLiter extends ParserBridgePos0[PairLiter]

  /* Unary Operators */
  object Not extends ParserBridgePos1[Expr, Not] {
    override def from(op: Parsley[_]): Parsley[Expr => Not] = super.from(op).label("unary operator")
  }
  object Neg extends ParserBridgePos1[Expr, Neg] {
    override def from(op: Parsley[_]): Parsley[Expr => Neg] = super.from(op).label("unary operator")
  }
  object Len extends ParserBridgePos1[Expr, Len] {
    override def from(op: Parsley[_]): Parsley[Expr => Len] = super.from(op).label("unary operator")
  }
  object Ord extends ParserBridgePos1[Expr, Ord] {
    override def from(op: Parsley[_]): Parsley[Expr => Ord] = super.from(op).label("unary operator")
  }
  object Chr extends ParserBridgePos1[Expr, Chr] {
    override def from(op: Parsley[_]): Parsley[Expr => Chr] = super.from(op).label("unary operator")
  }
  object Plus extends ParserBridgePos1[Expr, Plus] {
    override def from(op: Parsley[_]): Parsley[Expr => Plus] = super.from(op).label("unary operator")
  }

  /* Binary Operators */
  object Add extends ParserBridgePos2[Expr, Expr, Add] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Add] = super.from(op).label("binary operator")
  }
  object Sub extends ParserBridgePos2[Expr, Expr, Sub] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Sub] = super.from(op).label("binary operator")
  }
  object Mul extends ParserBridgePos2[Expr, Expr, Mul] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Mul] = super.from(op).label("binary operator")
  }
  object Div extends ParserBridgePos2[Expr, Expr, Div] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Div] = super.from(op).label("binary operator")
  }
  object Mod extends ParserBridgePos2[Expr, Expr, Mod] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Mod] = super.from(op).label("binary operator")
  }
  object GT extends ParserBridgePos2[Expr, Expr, GT] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => GT] = super.from(op).label("binary operator")
  }
  object GTE extends ParserBridgePos2[Expr, Expr, GTE] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => GTE] = super.from(op).label("binary operator")
  }
  object LT extends ParserBridgePos2[Expr, Expr, LT] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => LT] = super.from(op).label("binary operator")
  }
  object LTE extends ParserBridgePos2[Expr, Expr, LTE] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => LTE] = super.from(op).label("binary operator")
  }
  object Eq extends ParserBridgePos2[Expr, Expr, Eq] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Eq] = super.from(op).label("binary operator")
  }
  object NEq extends ParserBridgePos2[Expr, Expr, NEq] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => NEq] = super.from(op).label("binary operator")
  }
  object And extends ParserBridgePos2[Expr, Expr, And] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => And] = super.from(op).label("binary operator")
  }
  object Or extends ParserBridgePos2[Expr, Expr, Or] {
    override def from(op: Parsley[_]): Parsley[(Expr, Expr) => Or] = super.from(op).label("binary operator")
  }
}


