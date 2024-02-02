import parsley.errors.ErrorBuilder
import types._
import ast.{Prog, Stat}

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
        case ast.Declaration(typ, x, y) => {
          checkDeclaration(typ, x, y) match {
            case Some(err) => Option.apply(err)
            case None => checkStatements(stmts)
          }
        }
      }
    }
  }

  // typ x = y
  private def checkDeclaration(typ: Type, x: Ident, y: RValue): Option[String] = {
    typ match {
      case IntType() => getRvalueType(y) match {
        case Right(IntType()) => None
        case _ => Option.apply("Error: Invalid rvalue")
      }
    }
  }

  // x = y
  private def checkAssignment(x:LValue, y:RValue): Option[String] = ???

  // read
  private def checkRead(x:LValue): Option[String] = ???

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
    // Arithmetic Operators
    case Add(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(IntType())
        case _ => Left(s"Error can only apply + binary operator on Ints: $b")
      }
    case Sub(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(IntType())
        case _ => Left(s"Error can only apply - binary operator on Ints: $b")
      }
    case Mul(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(IntType())
        case _ => Left(s"Error can only apply * binary operator on Ints: $b")
      }
    case Div(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(IntType())
        case _ => Left(s"Error can only apply / binary operator on Ints: $b")
      }
    case Mod(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(IntType())
        case _ => Left(s"Error can only apply % binary operator on Ints: $b")
      }

    // Comparison Operators
    case GT(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType())
        case _ => Left(s"Error can only apply > comparison operators on Ints or Chars: $b")
      }
    case GTE(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType())
        case _ => Left(s"Error can only apply >= comparison operators on Ints or Chars: $b")
      }
    case LT(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType())
        case _ => Left(s"Error can only apply < comparison operators on Ints or Chars: $b")
      }
    case LTE(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType() | CharType()), Right(IntType() | CharType())) => Right(BoolType())
        case _ => Left(s"Error can only apply <= comparison operators on Ints or Chars: $b")
      }

    // Equality Operators
    case Eq(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (t1, t2) if t1 == t2 => Right(BoolType())
        case _ => Left(s"Error can only apply == equality operators on the same types: $b")
      }
    case NEq(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(IntType()), Right(IntType())) => Right(BoolType())
        case _ => Left(s"Error can only apply != inequality operators on Ints: $b")
      }

    // Logical Operators
    case And(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(BoolType()), Right(BoolType())) => Right(BoolType())
        case _ => Left(s"Error can only apply && logical operators on Booleans: $b")
      }
    case Or(x, y) =>
      (getExprType(x), getExprType(y)) match {
        case (Right(BoolType()), Right(BoolType())) => Right(BoolType())
        case _ => Left(s"Error can only apply || logical operators on Booleans: $b")
      }
  }

  private def getUnOpType(u: UnOpp): Either[String, Type] = {
    u match {
      case Not(expr) =>
        getExprType(expr) match {
          case Right(BoolType()) => Right(BoolType())
          case _ => Left("Error can only apply Not() on Booleans")
        }
      case Neg(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(IntType())
          case _ => Left("Error can only apply Neg() on Integers")
        }
      case Len(expr) =>
        getExprType(expr) match {
          case Right(_: StringType | _: ArrayType) => Right(IntType())
          case _ => Left("Error can only apply Len() on String or Array Types")
        }
      case Ord(expr) =>
        getExprType(expr) match {
          case Right(CharType()) => Right(IntType())
          case _ => Left("Error can only apply Ord() on Chars")
        }
      case Chr(expr) =>
        getExprType(expr) match {
          case Right(IntType()) => Right(CharType())
          case _ => Left("Error can only apply Chr() on Integers")
        }
    }
  }

  private def getAtomType(a: Atom): Either[String, Type] = {
    a match {
      case IntLit(_) => Right(IntType())
      case BoolLit(_) => Right(BoolType())
      case CharLit(_) => Right(CharType())
      case StrLit(_) => Right(StringType())
    }
  }
}
