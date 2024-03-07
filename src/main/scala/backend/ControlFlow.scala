package backend

import backend.IR.{LeaInstr, _}
import frontend.ast._
import backend.IRRegisters._
import backend.Size._
import frontend.validator.checkType

import scala.collection.immutable.Nil.toMap
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
class ControlFlow(val prog: Prog, val symbolTable:mutable.Map[String, Type]) {

  def CFProgram(): (Prog, mutable.Map[String, Type]) = {
    val variables: mutable.Map[String, Option[Expr]] = mutable.Map(symbolTable.keys.map(key => key -> None).toSeq: _*)
    (optimiseProg(prog, variables), symbolTable)
  }

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
  def evalCond(cond: Expr, identTables:List[mutable.Map[String, Option[Expr]]]): Option[Boolean] = {
    val condValues = ListBuffer.empty : ListBuffer[Option[Boolean]]
    for (identTable <- identTables) {
      identTable.mapValuesInPlace((_, v) => evaluateExpr(v, identTable)) : mutable.Map[String, Option[Expr]]
      val BoolLit(bool) = evaluateExpr(Option(cond), identTable).getOrElse()
      condValues.addOne(Option(bool))
    }
    if (checkBoolList(condValues.toList)) {
      condValues.head
    } else {
      Option.empty
    }
  }

  // Returns expressions in the forms of: IntLit(x), BoolLit(b), CharLit(chr) or StrLit(str)
  // Need to add handling of unknown identifiers from reads using Option
  def evaluateExpr(opExpr: Option[Expr], identTable: mutable.Map[String, Option[Expr]]): Option[Expr] = {
    val expr : Expr = opExpr.orNull
    expr match {
      case null =>
        Option.empty
      case IntLit(x) => Option(expr)
      case BoolLit(bool) => Option(expr)
      case CharLit(chr) => Option(expr)
      case StrLit(str) => Option(expr)
      case Neg(x) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        Option(IntLit(-1 * i)(expr.pos))
        
      }
      case Chr(x) => evaluateExpr(Option(x), identTable)
      case Ord(x) => evaluateExpr(Option(x), identTable)
      case Len(x) => ???
      case Add(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(IntLit(i + j)(expr.pos))
      }

      case Sub(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(IntLit(i - j)(expr.pos))
      }
      case Mul(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(IntLit(i * j)(expr.pos))
      }
      case Div(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(IntLit(i * j)(expr.pos))
      }

      case Mod(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(IntLit(i % j)(expr.pos))
      }
      case GT(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i > j)(expr.pos))
      }
      case GTE(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i >= j)(expr.pos))
      }
      case LT(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i < j)(expr.pos))
      }
      case LTE(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i <= j)(expr.pos))
      }
      case Eq(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i == j)(expr.pos))
      }
      case NEq(x, y) => {
        val IntLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val IntLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i != j)(expr.pos))
      }
      case And(x, y) => {
        val BoolLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val BoolLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i && j)(expr.pos))
      }
      case Or(x, y) => {
        val BoolLit(i) = evaluateExpr(Option(x), identTable).getOrElse()
        val BoolLit(j) = evaluateExpr(Option(y), identTable).getOrElse()
        Option(BoolLit(i || j)(expr.pos))
      }
      case Not(bool) => {
        val BoolLit(b) = evaluateExpr(Option(bool), identTable).getOrElse()
        Option(BoolLit(!b)(expr.pos))
      }
      case Ident(x) => evaluateExpr(identTable.getOrElse(x, Option.empty), identTable)
      case _ => ???
    }
  }

  def optimiseProg(prog: Prog, identTable:mutable.Map[String, Option[Expr]]) : (Prog) = {
    // var funcAllArgs : mutable.Map[Ident, ListBuffer[ListBuffer[Expr]]] = mutable.Map((prog.funcs.map(func => func.ident -> ListBuffer(ListBuffer())).toMap).toSeq: _*)
    var loopConds : mutable.Map[(Int, Int), ListBuffer[Option[Boolean]]] = mutable.Map()
    /**for (stat:Stat <- prog.stats : List[Stat]) {
      case Skip() => {

      }
      //TODO: REMOVE DUPLICATE DECLARATION AND ASSIGN CODE
      case Declaration(typ, ident, y) => {
        y match {
          case expr: Expr => {
            identTable(ident.toString) = evaluateExpr(Option(expr), identTable)
          }
          case Call(name, args) => {
            funcAllArgs.get(name) match {
              case Some(listbuffer) => funcAllArgs(name) = listbuffer :+ args
              case None => funcAllArgs(name) = ListBuffer(args)
            }
            identTable(ident.toString) = Option.empty
          }
        }
      }
      case Assign(ident: Ident, rValue) => rValue match {
        case expr: Expr => {
          identTable(ident.toString) = evaluateExpr(Option(expr), identTable)
        }
        case Call(name, args) => {
          funcAllArgs.get(name) match {
            case Some(listbuffer) => funcAllArgs(name) = listbuffer :+ args
            case None => funcAllArgs(name) = ListBuffer(args)
          }
          identTable(ident.toString) = Option.empty
        }
      }
      case Free(_) => {

      }
      case Print(expr) => {

      }
      case Println(expr) => {

      }
      case Read(ident: Ident) => {
        identTable(ident.toString) = Option.empty
      }

      // TODO: REMOVE DUPLICATION IN IF AND WHILE WITH A FUNCTION

      case If(cond, thenStat, elseStat) => {
        val calcBool = evaluateExpr(Option(cond), identTable)
        loopConds.get(stat.pos) match {
          case Some(listbuffer) => loopConds(stat.pos) = listbuffer :+ calcBool
          case None => loopConds(stat.pos) = ListBuffer(calcBool)
        }
      }
      case While(cond, doStat) => {
        val calcBool = evaluateExpr(Option(cond), identTable)
        loopConds.get(stat.pos) match {
          case Some(listbuffer) => loopConds(stat.pos) = listbuffer :+ calcBool
          case None => loopConds(stat.pos) = ListBuffer(calcBool)
        }
      }
      case Return(expr) => {

      }
      case Exit(expr) => {

      }
      case Scope(stats) => {

      }
    }
    for (loopCond <- loopConds) {
      if (checkBoolList(loopCond._2.toList)) {
        // This loop is always true or always false
        // statement has position: loopCond._1
        val loopValue = loopCond._2.head.get
      }

    }
    **/
    prog
  }

  // Unimplemented
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