package backend

import backend.IR.{LeaInstr, _}
import frontend.ast._
import backend.IRRegisters._
import backend.Size._
import frontend.validator.checkType

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
class ControlFlow(val prog: Prog, val symbolTable:mutable.Map[String, Type]) {

  def checkBoolList(bools: List[Option[Boolean]]): Boolean = {
    bools match {
      case Nil => false
      case _ => {
        val allTrue = bools.forall(_.contains(true))
        val allFalse = bools.forall(_.contains(false))
        if (allTrue || allFalse) allTrue
        else false
      }
    }
  }
  def evalCond(cond: Expr, identTables:List[mutable.Map[String, Expr]]): Option[Boolean] = {
    val condValues = ListBuffer.empty : ListBuffer[Option[Boolean]]
    for (identTable <- identTables) {
      identTable.mapValuesInPlace((_, v) => evaluateExpr(v, identTable)) : mutable.Map[String, Expr]
      val BoolLit(bool) = evaluateExpr(cond, identTable)
      condValues.addOne(Option(bool))
    }
    if (checkBoolList(condValues.toList)) {
      condValues.head
    } else {
      Option.empty
    }
  }

  def evaluateExpr(expr: Expr, identTable: mutable.Map[String, Expr]): Expr = {
    expr match {
      case IntLit(x) => expr
      case BoolLit(bool) => expr
      case CharLit(chr) => expr
      case StrLit(str) => expr
      case Ident(name) => expr
      case Neg(x) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        IntLit(-1 * i)(expr.pos)
      }
      case Chr(x) => evaluateExpr(x, identTable)
      case Ord(x) => evaluateExpr(x, identTable)
      case Len(x) => ???
      case Add(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        IntLit(i + j)(expr.pos)
      }

      case Sub(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        IntLit(i - j)(expr.pos)
      }
      case Mul(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        IntLit(i * j)(expr.pos)
      }
      case Div(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        IntLit(i * j)(expr.pos)
      }

      case Mod(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        IntLit(i % j)(expr.pos)
      }
      case GT(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i > j)(expr.pos)
      }
      case GTE(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i >= j)(expr.pos)
      }
      case LT(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i < j)(expr.pos)
      }
      case LTE(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i <= j)(expr.pos)
      }
      case Eq(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i == j)(expr.pos)
      }
      case NEq(x, y) => {
        val IntLit(i) = evaluateExpr(x, identTable)
        val IntLit(j) = evaluateExpr(y, identTable)
        BoolLit(i != j)(expr.pos)
      }
      case And(x, y) => {
        val BoolLit(i) = evaluateExpr(x, identTable)
        val BoolLit(j) = evaluateExpr(y, identTable)
        BoolLit(i && j)(expr.pos)
      }
      case Or(x, y) => {
        val BoolLit(i) = evaluateExpr(x, identTable)
        val BoolLit(j) = evaluateExpr(y, identTable)
        BoolLit(i || j)(expr.pos)
      }
      case Not(bool) => {
        val BoolLit(b) = evaluateExpr(bool, identTable)
        BoolLit(!b)(expr.pos)
      }
      case Ident(x) => evaluateExpr(identTable.get(x).orNull, identTable)
      case _ => ???
    }
  }

  def optimiseProg(): Unit = {
    val variables: mutable.Map[String, Option[Expr]] = mutable.Map(symbolTable.mapValues(_ => None).toSeq: _*)
    /**for (stat:Stat <- prog.stats : List[Stat]) {
      case Skip() => {

      }
      case Declaration(typ, x, y) => {

      }
      case Assign(Ident(x), rValue) => rValue match {
        case expr: Expr => {

        }
        case Call(name, args) => {

        }
      }
      case Read(v: Ident) => {

      }
      case Free(_) => {

      }
      case Print(expr) => {

      }
      case Println(expr) => {

      }
      case Read(ident: Ident) => {

      }
      case If(cond, thenStat, elseStat) => {

      }
      case While(cond, doStat) => {

      }
      case Return(expr) => {

      }
      case Exit(expr) => {

      }
      case Scope(stats) => {

      }
    }
     **/
  }

  def hasSideEffects(func:Func): Boolean = {
    true
  }
  def optimiseFunc(func:Func, symbolTable:mutable.Map[String, Type], identTables:List[mutable.Map[String, Expr]]): Unit = {
    var controls = ListBuffer.empty
    for (arg <- func.paramList) {

    }
    for (stat <- func.stats) {
      stat match {
        //case If(cond, thenStat, elseStat) =>
          //evalCond(cond) match {
            //None =>
          //}

      case While(cond, doStat) =>

      case _ =>
        // Add handling for calls
      }
    }

  }
}