import ast._
import waccErrors._
//import scala.annotation.tailrec
import scala.collection.mutable

object Validator {

  val nullPos: (Int, Int) = (-1, -1)

  def sameType(t1: Type, t2: Type): Boolean = {
    if (t1 == t2) {
      true
    } else {
      case (ArrayType(arrt1), ArrayType(arrt2)) => sameType(arrt1, arrt2)
      case (PairType(t1l, t1r), PairType(t2l, t2r)) => sameType(t1l, t2l) && sameType(t1r, t2r)
      case (PairType(_, _), Pair()) => true
      case (Pair(), PairType(_, _)) => true
      case _ => t1 == AnyType || t2 == AnyType
    }
  }

  def SemanticErrorOccurred(reason: String, pos: (Int, Int))(implicit errors: mutable.ListBuffer[Error], source: String, waccLines: Array[String]): Unit = {
    errors += SemanticError.genError(reason, pos)
  }

  def checkType(expr: LValue)(implicit symTable: mutable.Map[String, Type]): Type = {
    expr match {
      case Ident(name) => symTable.getOrElse(name, NoTypeExists)
      case ArrayElem(id, _) => checkType(id: Expr) match {
        case ArrayType(arrTyp) => arrTyp
        case _ => NoTypeExists
      }
      case PairFst(value) => checkType(value) match {
        case Pair() => AnyType
        case PairType(pairTyp, _) => pairTyp
        case _ => NoTypeExists
      }
      case PairSnd(value) => checkType(value) match {
        case Pair() => AnyType
        case PairType(_, pairTyp) => pairTyp
        case _ => NoTypeExists
      }
    }
  }

  def checkType(expr: RValue)(implicit symTable: mutable.Map[String, Type], funcTable: List[Func]): Type = expr match {
    case exp: Expr => checkType(exp)
    case NewPair(exp1, exp2) =>
      val exp1Type: PairElemType = checkType(exp1) match {
        case PairType(_, _) => Pair()(nullPos)
        case pairType: PairElemType => pairType
        case _ => NoTypeExists
      }
      val exp2Type: PairElemType = checkType(exp2) match {
        case PairType(_, _) => Pair()(nullPos)
        case pairType: PairElemType => pairType
        case _ => NoTypeExists
      }
      PairType(exp1Type, exp2Type)(null)
    case Call(ident, params) => funcTable.find(x => x.ident.name == ident.name) match {
      case Some(value) => value.typ
      case None => NoTypeExists
    }
    case PairFst(value) => checkType(value) match {
      case Pair() => AnyType
      case PairType(pairTyp, _) => pairTyp
      case _ => NoTypeExists
    }
    case PairSnd(value) => checkType(value) match {
      case Pair() => AnyType
      case PairType(_, pairTyp) => pairTyp
      case _ => NoTypeExists
    }
    case ArrayLit(elems) => if (elems.isEmpty) ArrayType(AnyType)(nullPos) else ArrayType(checkType(elems.head))(nullPos)
  }

  def checkType(expr: Expr)(implicit symTable: mutable.Map[String, Type]): Type = {
    expr match {
      case Sub(_, _) => IntType()(nullPos)
      case Add(_, _) => IntType()(nullPos)
      case Mul(_, _) => IntType()(nullPos)
      case Div(_, _) => IntType()(nullPos)
      case Mod(_, _) => IntType()(nullPos)
      case GT(_, _) => BoolType()(nullPos)
      case GTE(_, _) => BoolType()(nullPos)
      case LT(_, _) => BoolType()(nullPos)
      case LTE(_, _) => BoolType()(nullPos)
      case Eq(_, _) => BoolType()(nullPos)
      case NEq(_, _) => BoolType()(nullPos)
      case And(_, _) => BoolType()(nullPos)
      case Or(_, _) => BoolType()(nullPos)
      case Not(_) => BoolType()(nullPos)
      case Len(_) => IntType()(nullPos)
      case Neg(_) => IntType()(nullPos)
      case Ord(_) => IntType()(nullPos)
      case Chr(_) => CharType()(nullPos)
      case Plus(_) => IntType()(nullPos)
      case ArrayElem(id, _) => checkType(id: Expr) match {
        case ArrayType(arrTyp) => arrTyp
        case _ => NoTypeExists
      }
      case BoolLit(_) => BoolType()(nullPos)
      case IntLit(_) => IntType()(nullPos)
      case CharLit(_) => CharType()(nullPos)
      case Ident(name) => symTable.getOrElse(name, NoTypeExists)
      case StrLit(_) => StringType()(nullPos)
    }
  }
}

//class Validator(val code: Array[String]) {
//  private val symbolTable = mutable.Map[Ident, Type]()
//
//  def check(prog: Prog): Option[String] = {
//    checkStatements(prog.stats)
//  }
//
//  @tailrec
//  private def checkStatements(stats: List[Stat]): Option[String] = {
//    stats match {
//      case Nil => None
//      case stmt :: stmts => stmt match {
//        case Declaration(typ, x, y) =>
//          checkDeclaration(typ, x, y) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        case Read(lValue) => getLValueType(lValue) match {
//          case Left(err) => Some(err)
//          case Right(_) => checkStatements(stmts)
//        }
//        case Assign(lValue, y) =>
//          checkAssignment(lValue, y) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//
//        case Free(expr: Expr) =>
//          checkExpr(expr: Expr) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        case Return(expr: Expr) =>
//          checkExpr(expr: Expr) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        case Exit(expr: Expr) =>
//          checkExpr(expr: Expr) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        case Print(expr: Expr) =>
//          checkExpr(expr: Expr) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        case Println(expr: Expr) =>
//          checkExpr(expr: Expr) match {
//            case Some(err) => Option.apply(err)
//            case None => checkStatements(stmts)
//          }
//        // TODO: Remove Duplication
//        // TODO: Add all cases
//        case _ => Option.empty
//      }
//    }
//  }
//
//  // typ x = y
//  private def checkDeclaration[T <: Type](typ: T, x: Ident, y: RValue): Option[String] = {
//    if (symbolTable.contains(x)) {
//      return Option.apply(identError(x.pos, s"Variable name '${x.name}' is already defined"))
//    }
//    getRvalueType(y) match {
//      case Right(rType) => if (rType == typ) {
//        symbolTable += (x -> typ)
//        None
//      } else Option.apply(typeErrorStr(rType.pos,
//        s"Cannot assign ${typeToStr(rType, brackets_? = false)} to ${typeToStr(typ, brackets_? = false)}", typeToStr(typ), typeToStr(rType)))
//      case Left(errorMsg) => Some(errorMsg)
//    }
//  }
//
//  private def getLValueType(l: LValue): Either[String, Type] = {
//    l match {
//      case i: Ident => getIdentType(i)
//      case p: PairElem => getPairElemType(p)
//      case ArrayElem(ident, xs) => checkArrayIndex(xs) match {
//        case Some(err) => Left(err)
//        case _ => getIdentType(ident)
//      }
//    }
//  }
//
//  private def checkArrayIndex(exprs: List[Expr]): Option[String] = {
//    for (expr <- exprs) {
//      getExprType(expr) match {
//        case Right(IntType()) =>
//        case Right(typ) => return Option.apply(typeErrorStr(expr.pos, "Array Indexes must be of type int", "array[...][⟨int⟩][...]",
//          s"array[...][${typeToStr(typ)}][...]"))
//        case Left(error) => return Option.apply(error)
//      }
//    }
//    None
//  }
//
//  private def getIdentType(i: Ident): Either[String, Type] = {
//    if (symbolTable.contains(i)) {
//      Right(symbolTable(i))
//    } else {
//      Left(identError(i.pos, s"Variable '${i.name}' undefined"))
//    }
//  }
//
//  private def getPairElemType(p: PairElem): Either[String, Type] = {
//    p match {
//      case PairFst(lVal) => getLValueType(lVal)
//      case PairSnd(lVal) => getLValueType(lVal)
//    }
//  }
//
//  // x = y
//  private def checkAssignment(x: LValue, y: RValue): Option[String] = {
//    getLValueType(x) match {
//      case Right(lType) => getRvalueType(y) match {
//        case Right(rType) => if (lType == rType) None else Option.apply(typeErrorStr(rType.pos, "Assignment value must be of same type as variable", typeToStr(lType),
//          typeToStr(rType)))
//        case Left(err) => Option.apply(err)
//      }
//      case Left(err) => Option.apply(err)
//    }
//  }
//
//  private def getRvalueType(r: RValue): Either[String, Type] = {
//    r match {
//      case expr: Expr => getExprType(expr)
//    }
//  }
//
//  private def checkExpr(exp: Expr): Option[String] = {
//    exp match {
//      case expr: Expr => getExprType(expr) match {
//        case Right(rType) => None
//        case Left(errorMsg) => Some(errorMsg)
//      }
//    }
//  }
//
//  private def getExprType(e: Expr): Either[String, Type] = {
//    e match {
//      case atom: Atom => getAtomType(atom)
//      case unOpp: UnOpp => getUnOpType(unOpp)
//      case binOpp: BinOpp => getBinOpType(binOpp)
//    }
//  }
//
//  private def getBinOpType(b: BinOpp): Either[String, Type] = {
//    b match {
//      // Arithmetic Operators
//      case Add(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '+' binary operator on ints", "⟨int⟩ + ⟨int⟩",
//            s"${typeToStr(typeL)} + ${typeToStr(typeR)}"))
//        }
//      case Sub(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '-' binary operator on ints", "⟨int⟩ - ⟨int⟩",
//            s"${typeToStr(typeL)} - ${typeToStr(typeR)}"))
//        }
//      case Mul(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '*' binary operator on ints", "⟨int⟩ * ⟨int⟩",
//            s"${typeToStr(typeL)} * ${typeToStr(typeR)}"))
//        }
//      case Div(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '/' binary operator on ints", "⟨int⟩ / ⟨int⟩",
//            s"${typeToStr(typeL)} / ${typeToStr(typeR)}"))
//        }
//      case Mod(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '%' binary operator on ints", "⟨int⟩ % ⟨int⟩",
//            s"${typeToStr(typeL)} % ${typeToStr(typeR)}"))
//        }
//
//      // Comparison Operators
//      case GT(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '>' binary operator on ints or chars", "⟨int⟩ > ⟨int⟩ | ⟨char⟩ > ⟨char⟩",
//            s"${typeToStr(typeL)} > ${typeToStr(typeR)}"))
//        }
//      case GTE(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '>=' binary operator on ints or chars", "⟨int⟩ >= ⟨int⟩ | ⟨char⟩ >= ⟨char⟩",
//            s"${typeToStr(typeL)} >= ${typeToStr(typeR)}"))
//        }
//      case LT(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '<' binary operator on ints or chars", "⟨int⟩ < ⟨int⟩ | ⟨char⟩ < ⟨char⟩",
//            s"${typeToStr(typeL)} > ${typeToStr(typeR)}"))
//        }
//      case LTE(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '<=' binary operator on ints or chars", "⟨int⟩ <= ⟨int⟩ | ⟨char⟩ <= ⟨char⟩",
//            s"${typeToStr(typeL)} <= ${typeToStr(typeR)}"))
//        }
//
//      // Equality Operators
//      case Eq(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (t1, t2) if t1 == t2 => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '==' binary operator on the same types", "⟨type⟩ == ⟨type⟩",
//            s"${typeToStr(typeL)} == ${typeToStr(typeR)}"))
//        }
//      case NEq(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(IntType()), Right(IntType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '!=' binary operator on the same types", "⟨type⟩ != ⟨type⟩",
//            s"${typeToStr(typeL)} != ${typeToStr(typeR)}"))
//        }
//
//      // Logical Operators
//      case And(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '&&' binary operator on bools", "⟨bool⟩ && ⟨bool⟩",
//            s"${typeToStr(typeL)} && ${typeToStr(typeR)}"))
//        }
//      case Or(x, y) =>
//        (getExprType(x), getExprType(y)) match {
//          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
//          case (Right(typeL), Right(typeR)) => Left(typeErrorStr(b.pos, "Can only apply '||' binary operator on bools", "⟨bool⟩ || ⟨bool⟩",
//            s"${typeToStr(typeL)} || ${typeToStr(typeR)}"))
//        }
//    }
//  }
//
//  private def getUnOpType(u: UnOpp): Either[String, Type] = {
//    u match {
//      case Not(expr) =>
//        getExprType(expr) match {
//          case Right(BoolType()) => Right(BoolType()(u.pos))
//          case Right(uType) => Left(typeErrorStr(u.pos, "Can only apply '!' unary operator on bools", "!⟨bool⟩",
//            s"!${typeToStr(uType)}"))
//        }
//      case Neg(expr) =>
//        getExprType(expr) match {
//          case Right(IntType()) => Right(IntType()(u.pos))
//          case Right(uType) => Left(typeErrorStr(u.pos, "Can only apply '-' unary operator on ints", "-⟨int⟩",
//            s"-${typeToStr(uType)}"))
//        }
//      case Len(expr) =>
//        getExprType(expr) match {
//          case Right(_: StringType | _: ArrayType) => Right(IntType()(u.pos))
//          case Right(uType) => Left(typeErrorStr(u.pos, "Can only apply 'len' unary operator on strings or arrays", "len ⟨string⟩ | len ⟨type[]⟩",
//            s"len ${typeToStr(uType)}"))
//        }
//      case Ord(expr) =>
//        getExprType(expr) match {
//          case Right(CharType()) => Right(IntType()(u.pos))
//          case Right(uType) => Left(typeErrorStr(u.pos, "Can only apply 'ord' unary operator on chars", "ord ⟨char⟩",
//            s"ord ${typeToStr(uType)}"))
//        }
//      case Chr(expr) =>
//        getExprType(expr) match {
//          case Right(IntType()) => Right(CharType()(u.pos))
//          case Right(uType) => Left(typeErrorStr(u.pos, "Can only apply 'chr' unary operator on ints", "chr ⟨int⟩",
//            s"chr ${typeToStr(uType)}"))
//        }
//    }
//  }
//
//  private def getAtomType(a: Atom): Either[String, Type] = {
//    a match {
//      case IntLit(_) => Right(IntType()(a.pos))
//      case BoolLit(_) => Right(BoolType()(a.pos))
//      case CharLit(_) => Right(CharType()(a.pos))
//      case StrLit(_) => Right(StringType()(a.pos))
//      case i: Ident => getIdentType(i)
//    }
//  }
//
//  private def typeErrorStr(pos: (Int, Int), msg: String, expected: String, actual: String): String = {
//    val (line, col) = pos
//    val prevLine = code(line - 2)
//    val curLine = code(line - 1)
//    val afterLine = code(line)
//    val beforeCode = s"$line:"
//    val afterCode = " " * (beforeCode.length + col + 1)
//    s"""Type Error (line=$line, col=$col):
//       |  $msg.
//       |  Expected:   $expected
//       |  Actual:     $actual
//       |
//       || ${line - 1}:$prevLine
//       || $beforeCode$curLine
//       |$afterCode↑
//       || ${line + 1}:$afterLine""".stripMargin
//  }
//
//  private def identError(pos: (Int, Int), msg: String): String = {
//    val (line, col) = pos
//    val prevLine = code(line - 2)
//    val curLine = code(line - 1)
//    val afterLine = code(line)
//    val beforeCode = s"$line:"
//    val afterCode = " " * (beforeCode.length + col + 1)
//    s"""Name Error (line=$line, col=$col):
//       |  $msg.
//       |
//       || ${line - 1}:$prevLine
//       || $beforeCode$curLine
//       |$afterCode↑
//       || ${line + 1}:$afterLine""".stripMargin
//  }
//
//  private def typeToStr(lit: Type): String = lit match {
//    case IntType() => "⟨int⟩"
//    case BoolType() => "⟨bool⟩"
//    case CharType() => "⟨char⟩"
//    case StringType() => "⟨string⟩"
//    case PairType(_, _) => "⟨pair⟩"
//    case ArrayType(innerType) => typeToStr(innerType) + "[]"
//  }
//
//  private def typeToStr(lit: Type, brackets_? : Boolean): String = {
//    if (!brackets_?) {
//      lit match {
//        case IntType() => "int"
//        case BoolType() => "bool"
//        case CharType() => "char"
//        case StringType() => "string"
//        case PairType(_, _) => "pair"
//        case ArrayType(innerType) => typeToStr(innerType, brackets_?) + "[]"
//      }
//    } else {
//      typeToStr(lit)
//    }
//  }
//
//}
