package backend

import backend.IR.{LeaInstr, _}
import frontend.ast._
import backend.IRRegisters._
import backend.Size._
import frontend.validator.checkType

import scala.collection.immutable.Nil.toMap
import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import java.{util => ju}

class ControlFlow(val prog: Prog, val symbolTable:mutable.Map[String, Type], val MAX_UNROLLS: Int) {

  def CFProgram(): (Prog) = {
    val variables: mutable.Map[String, Option[Expr]] = mutable.Map(symbolTable.keys.map(key => key -> None).toSeq: _*)
    optimiseMainProg(prog, variables)
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
  def evaluateExpr(opExpr: Option[Expr], identTable: mutable.Map[String, Option[Expr]]): Option[Expr] = opExpr match {
    case Some(expr) => expr match {
      case IntLit(_) | BoolLit(_) | CharLit(_) | StrLit(_) => Some(expr)
      
      case Ident(name) => identTable.getOrElse(name, None)
      
      case Neg(x) => evaluateExpr(Some(x), identTable).collect { case IntLit(i) => IntLit(-i)(x.pos) }
      
      case Not(x) => evaluateExpr(Some(x), identTable).collect { case BoolLit(b) => BoolLit(!b)(x.pos) }
      
      case Add(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(IntLit(i + j)(expr.pos))
        case _ => None
      }
      
      case Sub(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(IntLit(i - j)(expr.pos))
        case _ => None
      }
      
      case Mul(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(IntLit(i * j)(expr.pos))
        case _ => None
      }
      
      case Div(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) if j != 0 => Some(IntLit(i / j)(expr.pos))
        case _ => None
      }
      
      case Mod(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) if j != 0 => Some(IntLit(i % j)(expr.pos))
        case _ => None
      }
      
      case And(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(BoolLit(i)), Some(BoolLit(j))) => Some(BoolLit(i && j)(expr.pos))
        case _ => None
      }
      
      case Or(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(BoolLit(i)), Some(BoolLit(j))) => Some(BoolLit(i || j)(expr.pos))
        case _ => None
      }
      
      case GT(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(BoolLit(i > j)(expr.pos))
        case _ => None
      }
      
      case GTE(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(BoolLit(i >= j)(expr.pos))
        case _ => None
      }
      
      case LT(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(BoolLit(i < j)(expr.pos))
        case _ => None
      }
      
      case LTE(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(IntLit(i)), Some(IntLit(j))) => Some(BoolLit(i <= j)(expr.pos))
        case _ => None
      }
      
      case Eq(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(l), Some(r)) => Some(BoolLit(l == r)(expr.pos))
        case _ => None
      }
      
      case NEq(x, y) => (evaluateExpr(Some(x), identTable), evaluateExpr(Some(y), identTable)) match {
        case (Some(l), Some(r)) => Some(BoolLit(l != r)(expr.pos))
        case _ => None
      }

      case _ => None
    }

    case None => None
  }



  def findParams(stats: List[Stat]): List[String] = {
    val paramsBuffer = ListBuffer.empty : ListBuffer[String]

    def extractIdentFromLValue(lValue: LValue): Unit = {
      lValue match {
        case Ident(name) => paramsBuffer += name
        case _ =>
      }
    }

    // assuming no side effects for functions
    def traverseStats(stats: List[Stat]) : Unit = {
      for (stat <- stats) {
        stat match {
          case Declaration(_, ident, _) => paramsBuffer += ident.name
          case AssignorInferDecl(lValue, _) => extractIdentFromLValue(lValue)
          case If(_, thenStat, elseStat) =>
            traverseStats(thenStat)
            traverseStats(elseStat)
          case While(_, doStat) => traverseStats(doStat)
          case Scope(stats) => traverseStats(stats)
          case _ =>
        }
      }
    }

    traverseStats(stats)
    paramsBuffer.toList
  }

  def findFunctionByIdent(ident: Ident): Option[Func] = {
    prog.funcs.find(_.ident == ident)
  }

  def optimiseMainProg(prog: Prog, variables:mutable.Map[String, Option[Expr]]) : (Prog) = {
    val RECURSION_LEVEL = 0
    optimiseProg(prog, variables, RECURSION_LEVEL)._1
  }

  def optimiseProg(prog: Prog, identTable:mutable.Map[String, Option[Expr]], RECURSION_LEVEL: Int) : (Prog, Option[Expr], ListBuffer[Option[Stat]]) = {
   var funcAllData: mutable.Map[Ident, ListBuffer[(Option[Expr], ListBuffer[Option[Stat]])]] =
      mutable.Map(prog.funcs.map(func => func.ident -> ListBuffer.empty[(Option[Expr], ListBuffer[Option[Stat]])]): _*)
    var loopConds : mutable.Map[(Int, Int), ListBuffer[Option[Boolean]]] = mutable.Map()
    var funcToChange: mutable.ListBuffer[(Int, Int)] = ListBuffer.empty
    var sideEffects = ListBuffer.empty[Option[Stat]] // currently only assumed to be print and println given wacc spec
    var returnValue : Option[Expr] = None
    var funcCallCounters: mutable.Map[Ident, Int] = mutable.Map().withDefaultValue(0)
    val RECURSION_LIMIT = 5
    var allStats = mutable.Stack[Stat]()
    allStats.pushAll(prog.stats.reverse)
    while (allStats.nonEmpty) {
      val stat = allStats.pop
      stat match {
        case Skip() => {

        }
        //TODO: REMOVE DUPLICATE DECLARATION AND ASSIGN CODE
        case Declaration(typ, ident, y) => {
          y match {
            case expr: Expr => {
              identTable(ident.name) = evaluateExpr(Option(expr), identTable)
            }
            // case ArrayLit
//            case NewPair(fst, snd)
//            case PairFst(_)
//            case PairSnd(_)
            case Call(name, args) => {
              findFunctionByIdent(name) match {
                case Some(func) =>
                  val localIdentTable = mutable.Map[String, Option[Expr]]()
                  args.zip(func.paramList).foreach { case (arg, param) =>
                    localIdentTable(param.ident.name) = evaluateExpr(Some(arg), identTable)
                  }
                  if (RECURSION_LEVEL >= RECURSION_LIMIT) {
                    identTable(ident.name) = Option.empty
                  } else {
                    val (optimisedBody, givenReturnValue, givenSideEffects) =
                      optimiseProg(prog.copy(stats = func.stats)(prog.pos), localIdentTable, RECURSION_LEVEL + 1)
                    identTable(ident.name) = givenReturnValue
                    funcAllData.get(name) match {
                      case Some(listbuffer) =>  {
                        funcToChange += stat.pos
                        funcAllData(name) = listbuffer += ((givenReturnValue, givenSideEffects))
                      }
                      case None => funcAllData(name) = ListBuffer((givenReturnValue, givenSideEffects))
                    }
                  }
                case _ => identTable(ident.name) = Option.empty
                }
            }
            case _ =>
              identTable(ident.name) = Option.empty
          }
        }
        case AssignorInferDecl(ident: Ident, rValue) => rValue match {
          case expr: Expr => {
            identTable(ident.name) = evaluateExpr(Option(expr), identTable)
          }
          case Call(name, args) => {
              findFunctionByIdent(name) match {
                case Some(func) =>
                  val localIdentTable = mutable.Map[String, Option[Expr]]()
                  args.zip(func.paramList).foreach { case (arg, param) =>
                    localIdentTable(param.ident.name) = evaluateExpr(Some(arg), identTable)
                  }
                  if (RECURSION_LEVEL >= RECURSION_LIMIT) {
                    identTable(ident.name) = Option.empty
                  } else {
                    val (optimisedBody, givenReturnValue, givenSideEffects) =
                      optimiseProg(prog.copy(stats = func.stats)(prog.pos), localIdentTable, RECURSION_LEVEL + 1)
                    identTable(ident.name) = givenReturnValue
                    funcAllData.get(name) match {
                      case Some(listbuffer) =>  {
                        funcToChange += stat.pos
                        funcAllData(name) = listbuffer += ((givenReturnValue, givenSideEffects))
                      }
                      case None => funcAllData(name) = ListBuffer((givenReturnValue, givenSideEffects))
                    }
                  }
                case _ => identTable(ident.name) = Option.empty
                }
            }
          case _ => identTable(ident.name) = Option.empty
        }
        case Free(_) => {

        }
        case Print(expr) => {
          val printStat = evaluateExpr(Some(expr), identTable) match {
            case Some(printVal) => Option(Print(printVal)(stat.pos))
            case _ => None
          }
          sideEffects.addOne(printStat)
        }
        case Println(expr) => {
          val printStat = evaluateExpr(Some(expr), identTable) match {
            case Some(printVal) => Option(Println(printVal)(stat.pos))
            case _ => None
          }
          sideEffects.addOne(printStat)
        }
        case Read(ident: Ident) => {
          identTable(ident.name) = Option.empty
        }

        // TODO: REMOVE DUPLICATION IN IF AND WHILE WITH A FUNCTION

        case If(cond, thenStat, elseStat) => {
          val calcBool = evaluateExpr(Option(cond), identTable) match {
            case Some(BoolLit(bool)) => Option(bool)
            case _ => Option.empty[Boolean]
          }
          loopConds.getOrElseUpdate(stat.pos, ListBuffer.empty[Option[Boolean]]) += calcBool
          calcBool match {
            case Some(true) => allStats.pushAll(thenStat.reverse)
            case Some(false) => allStats.pushAll(elseStat.reverse)
            case _ =>  {
              for (param <- findParams(thenStat)) {
                identTable(param) = Option.empty
              }
              for (param <- findParams(elseStat)) {
                identTable(param) = Option.empty
              }
            }

              // Iterate through statements and mark anything assigned or declared
              // as unknown, additionally do the same for any function calls as well
              // TODO: extend the above by also adding a way to compare variable outputs from both blocks
              // such as if both blocks make a = true then it can be true instead of unknown
          }
        }
        case While(cond, doStat) => {
          val calcBool = evaluateExpr(Option(cond), identTable) match {
            case Some(BoolLit(bool)) => Option(bool)
            case _ => Option.empty[Boolean]
          }
          loopConds.getOrElseUpdate(stat.pos, ListBuffer.empty[Option[Boolean]]) += calcBool
          calcBool match {
            case Some(true) => {
              allStats.push(stat)
              allStats.pushAll(doStat.reverse)
            }
            case Some(false) =>
            case _ => {
              for (param <- findParams(doStat)) {
                identTable(param) = Option.empty
              }
          }
            // Iterate through statements and mark anything assigned or declared
            // as unknown, additionally do the same for any function calls as well
          }
        }
        case Return(expr) => {
          returnValue = evaluateExpr(Some(expr), identTable)
        }
        case Exit(expr) => {

        }
        case Scope(stats) => {

        }
        case _ =>
      }
    }

    val statsToChange : mutable.Map[(Int, Int), Boolean] = mutable.Map.empty
    val statsToUnroll: mutable.Map[(Int, Int), Int] = mutable.Map.empty

    for (loopCond <- loopConds) {
      val posToChange = loopCond._1
      val conditions = loopCond._2.toList
      if (checkBoolList(conditions)) {
        statsToChange(posToChange) = conditions.head.get
      } else {
        val trueCount = conditions.takeWhile(_.contains(true)).size
        if (trueCount > 0 && conditions.size == trueCount + 1 && conditions.last.contains(false) && trueCount < MAX_UNROLLS) {
          statsToUnroll(posToChange) = trueCount
        }
      }
    }
    var modifiedStats = prog.stats.flatMap {
      stat =>
        if (statsToChange.contains(stat.pos) | funcToChange.contains(stat.pos)) {
          stat match {
            case If(cond, thenStat, elseStat) => {
              if (statsToChange(stat.pos)) {
                thenStat
              } else {
                elseStat
              }
            }
            case While(cond, doStat) => {
              statsToUnroll.get(stat.pos) match {
                case Some(iterationCount) => 
                  (1 to iterationCount).flatMap(_ => doStat).toList
                case None if !statsToChange(stat.pos) =>
                  List.empty
                case _ =>
                  List(stat)
              }
            }
            case Declaration(typ, ident, rValue) => {
              rValue match {
                case expr: Expr => List(stat)
                case Call(name, args) => {
                  if (RECURSION_LEVEL >= RECURSION_LIMIT) {
                    List(stat)
                  } else {
                    val currentCount = funcCallCounters.getOrElse(name, 0)
                    funcCallCounters.update(name, currentCount + 1)
                    funcAllData.get(name) match {
                      case Some(callData) if currentCount < callData.size =>
                        val (returnValueOpt, sideEffectsOpt) = callData(currentCount)
                        val allSideEffectsDefined = sideEffectsOpt.forall(_.isDefined)
                        
                        if (returnValueOpt.isDefined && allSideEffectsDefined) {
                          val returnValue = returnValueOpt.get
                          val extractedSideEffects = sideEffectsOpt.flatMap {
                            case Some(Print(expr)) => List(Print(expr)(stat.pos))
                            case Some(Println(expr)) => List(Println(expr)(stat.pos))
                            case _ => None
                          }
                          extractedSideEffects.toList :+ AssignorInferDecl(ident, returnValue)(stat.pos)
                        } else {
                          List(stat)
                        }
                      case _ => List(stat)
                    }
                  }
                }
                case _ => List(stat)
              }
            }
            case AssignorInferDecl(ident: Ident, rValue) => rValue match {
              case expr: Expr => List(stat)
              case Call(name, args) => {
                  if (RECURSION_LEVEL >= 1) {
                    List(stat)
                  } else {
                    val currentCount = funcCallCounters.getOrElse(name, 0)
                    funcCallCounters.update(name, currentCount + 1)
                    funcAllData.get(name) match {
                      case Some(callData) if currentCount < callData.size =>
                        val (returnValueOpt, sideEffectsOpt) = callData(currentCount)
                        val allSideEffectsDefined = sideEffectsOpt.forall(_.isDefined)
                        
                        if (returnValueOpt.isDefined && allSideEffectsDefined) {
                          val returnValue = returnValueOpt.get
                          val extractedSideEffects = sideEffectsOpt.flatMap {
                            case Some(Print(expr)) => List(Print(expr)(stat.pos))
                            case Some(Println(expr)) => List(Println(expr)(stat.pos))
                            case _ => None
                          }
                          extractedSideEffects.toList :+ AssignorInferDecl(ident, returnValue)(stat.pos)
                        } else {
                          List(stat)
                        }
                      case _ => List(stat)
                    }
                  }
                }
              case _ => List(stat)
            }

            case _ => List(stat)
          }
        }
        else List(stat)
    }

    (prog.copy(stats = modifiedStats)(0, 0), returnValue, sideEffects)
  }
}