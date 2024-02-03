import ast._
import parsley.errors.ErrorBuilder

import scala.annotation.tailrec

object validator {

  def check[Err: ErrorBuilder](prog: Prog): Option[String] = {
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
      case Right(rType) if rType == typ => None
      case _ => Some("Error: Invalid rvalue")
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
          case _ => Left(s"Error can only apply + binary operator on Ints: $b")
        }
      case Sub(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case _ => Left(s"Error can only apply - binary operator on Ints: $b")
        }
      case Mul(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case _ => Left(s"Error can only apply * binary operator on Ints: $b")
        }
      case Div(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case _ => Left(s"Error can only apply / binary operator on Ints: $b")
        }
      case Mod(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(IntType()(b.pos))
          case _ => Left(s"Error can only apply % binary operator on Ints: $b")
        }

      // Comparison Operators
      case GT(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply > comparison operators on Ints or Chars: $b")
        }
      case GTE(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply >= comparison operators on Ints or Chars: $b")
        }
      case LT(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply < comparison operators on Ints or Chars: $b")
        }
      case LTE(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply <= comparison operators on Ints or Chars: $b")
        }

      // Equality Operators
      case Eq(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (t1, t2) if t1 == t2 => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply == equality operators on the same types: $b")
        }
      case NEq(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(IntType()), Right(IntType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply != inequality operators on Ints: $b")
        }

      // Logical Operators
      case And(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply && logical operators on Booleans: $b")
        }
      case Or(x, y) =>
        (getExprType(x), getExprType(y)) match {
          case (Right(BoolType()), Right(BoolType())) => Right(BoolType()(b.pos))
          case _ => Left(s"Error can only apply || logical operators on Booleans: $b")
        }
    }
  }

  private def getUnOpType(u: UnOpp): Either[String, Type] = {
    u match {
      case Not(expr) =>
        getExprType(expr) match {
          case Right(BoolType()) => Right(BoolType()(u.pos))
          case _ => Left("Error can only apply Not() on Booleans")
        }
      case Neg(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(IntType()(u.pos))
          case _ => Left("Error can only apply Neg() on Integers")
        }
      case Len(expr) =>
        getExprType(expr) match {
          case Right(_: StringType | _: ArrayType) => Right(IntType()(u.pos))
          case _ => Left("Error can only apply Len() on String or Array Types")
        }
      case Ord(expr) =>
        getExprType(expr) match {
          case Right(CharType()) => Right(IntType()(u.pos))
          case _ => Left("Error can only apply Ord() on Chars")
        }
      case Chr(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(CharType()(u.pos))
          case _ => Left("Error can only apply Chr() on Integers")
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
}
