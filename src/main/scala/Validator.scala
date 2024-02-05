import ast._
import parsley.errors.ErrorBuilder

import scala.annotation.tailrec

class Validator(val code: Array[String]) {

  def check(prog: Prog): Option[String] = {
    checkStatements(prog.stats)
  }

  @tailrec
  private def checkStatements(stats: List[Stat]): Option[String] = {
    stats match {
      case Nil => None
      case stmt :: stmts => stmt match {
        case Declaration(typ, x, y) =>
          checkDeclaration(typ, x, y) match {
            case Some(err) => Option.apply(err)
            case None => checkStatements(stmts)
          }
        // TODO: Add all cases
        case _ => Option.empty
      }
    }
  }

  // typ x = y
  private def checkDeclaration[T <: Type](typ: T, x: Ident, y: RValue): Option[String] = {
    getRvalueType(y) match {
      case Right(rType) => if (rType == typ) None else Some(s"Type Error: Cannot assign $rType to $typ")
      case Left(errorMsg) => Some(errorMsg)
    }
  }


  // x = y
  private def checkAssignment(x: LValue, y: RValue): Option[String] = ???

  // read
  private def checkRead(x: LValue): Option[String] = ???

  private def getRvalueType(r: RValue): Either[String, Type] = {
    r match {
      case expr: Expr => getExprType(expr)
    }
  }

  private def getExprType(e: Expr): Either[String, Type] = {
    e match {
      case atom: Atom => getAtomType(atom)
      case unOpp: UnOpp => getUnOpType(unOpp)
      case binOpp: BinOpp => getBinOpType(binOpp)
    }
  }

  private def getBinOpType(b: BinOpp): Either[String, Type] = {
    b match {
      // Arithmetic Operators
      case Add(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '+' binary operator on ints", "⟨int⟩ + ⟨int⟩",
            s"${typeToStr(typeL)} + ${typeToStr(typeR)}")
        }
      case Sub(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '-' binary operator on ints", "⟨int⟩ - ⟨int⟩",
            s"${typeToStr(typeL)} - ${typeToStr(typeR)}")
        }
      case Mul(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '*' binary operator on ints", "⟨int⟩ * ⟨int⟩",
            s"${typeToStr(typeL)} * ${typeToStr(typeR)}")
        }
      case Div(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '/' binary operator on ints", "⟨int⟩ / ⟨int⟩",
            s"${typeToStr(typeL)} / ${typeToStr(typeR)}")
        }
      case Mod(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '%' binary operator on ints", "⟨int⟩ % ⟨int⟩",
            s"${typeToStr(typeL)} % ${typeToStr(typeR)}")
        }

      // Comparison Operators
      case GT(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '>' binary operator on ints or chars", "⟨int⟩ > ⟨int⟩ | ⟨char⟩ > ⟨char⟩",
            s"${typeToStr(typeL)} > ${typeToStr(typeR)}")
        }
      case GTE(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '>=' binary operator on ints or chars", "⟨int⟩ >= ⟨int⟩ | ⟨char⟩ >= ⟨char⟩",
            s"${typeToStr(typeL)} >= ${typeToStr(typeR)}")
        }
      case LT(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '<' binary operator on ints or chars", "⟨int⟩ < ⟨int⟩ | ⟨char⟩ < ⟨char⟩",
            s"${typeToStr(typeL)} > ${typeToStr(typeR)}")
        }
      case LTE(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '<=' binary operator on ints or chars", "⟨int⟩ <= ⟨int⟩ | ⟨char⟩ <= ⟨char⟩",
            s"${typeToStr(typeL)} <= ${typeToStr(typeR)}")
        }

      // Equality Operators
      case Eq(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (t1, t2) if t1 == t2 => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '==' binary operator on the same types", "⟨type⟩ == ⟨type⟩",
            s"${typeToStr(typeL)} == ${typeToStr(typeR)}")
        }
      case NEq(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '!=' binary operator on the same types", "⟨type⟩ != ⟨type⟩",
            s"${typeToStr(typeL)} != ${typeToStr(typeR)}")
        }

      // Logical Operators
      case And(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '&&' binary operator on bools", "⟨bool⟩ && ⟨bool⟩",
            s"${typeToStr(typeL)} && ${typeToStr(typeR)}")
        }
      case Or(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
          case (Right(typeL), Right(typeR)) => typeErrorStr(b.pos, "Can only apply '||' binary operator on bools", "⟨bool⟩ || ⟨bool⟩",
            s"${typeToStr(typeL)} || ${typeToStr(typeR)}")
        }
    }
  }

  private def getUnOpType(u: UnOpp): Either[String, Type] = {
    u match {
      case Not(expr) =>
        getExprType(expr) match {
          case Right(BoolType()) => Right(BoolType()(u.pos))
          case Right(uType) => typeErrorStr(u.pos, "Can only apply '!' unary operator on bools", "!⟨bool⟩",
            s"!${typeToStr(uType)}")
        }
      case Neg(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(IntType()(u.pos))
          case Right(uType) => typeErrorStr(u.pos, "Can only apply '-' unary operator on ints", "-⟨int⟩",
            s"-${typeToStr(uType)}")
        }
      case Len(expr) =>
        getExprType(expr) match {
          case Right(_: StringType | _: ArrayType) => Right(IntType()(u.pos))
          case Right(uType) => typeErrorStr(u.pos, "Can only apply 'len' unary operator on strings or arrays", "len ⟨string⟩ | len ⟨type[]⟩",
            s"len ${typeToStr(uType)}")
        }
      case Ord(expr) =>
        getExprType(expr) match {
          case Right(CharType()) => Right(IntType()(u.pos))
          case Right(uType) => typeErrorStr(u.pos, "Can only apply 'ord' unary operator on chars", "ord ⟨char⟩",
            s"ord ${typeToStr(uType)}")
        }
      case Chr(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(CharType()(u.pos))
          case Right(uType) => typeErrorStr(u.pos, "Can only apply 'chr' unary operator on ints", "chr ⟨int⟩]⟩",
            s"chr ${typeToStr(uType)}")
        }
    }
  }

  private def getAtomType(a: Atom): Either[String, Type] = {
    a match {
      case IntLit(_) => Right(IntType()(a.pos))
      case BoolLit(_) => Right(BoolType()(a.pos))
      case CharLit(_) => Right(CharType()(a.pos))
      case StrLit(_) => Right(StringType()(a.pos))
    }
  }

  private def typeErrorStr(pos: (Int, Int), msg: String, expected: String, actual: String): Either[String, Type] = {
    val (line, col) = pos
    val prevLine = code(line-2)
    val curLine = code(line-1)
    val afterLine = code(line)
    val beforeCode = s"$line:"
    val afterCode = " " * (beforeCode.length + col + 1)
    Left(
      s"""Type Error (line=$line, col=$col):
         |  $msg.
         |  Expected:   $expected
         |  Actual:     $actual
         |
         || ${line-1}:$prevLine
         || $beforeCode$curLine
         |$afterCode↑
         || ${line+1}:$afterLine""".stripMargin
    )
  }

  private def typeToStr(lit: Type): String = lit match {
    case IntType() => "⟨int⟩"
    case BoolType() => "⟨bool⟩"
    case CharType() => "⟨char⟩"
    case StringType() => "⟨string⟩"
    case PairType(_, _) => "pair⟩"
    case ArrayType(innerType) => typeToStr(innerType) + "[]"
  }
}
