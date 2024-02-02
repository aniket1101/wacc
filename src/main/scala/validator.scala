import ast._
import parsley.errors.ErrorBuilder

object validator {
  def check[Err: ErrorBuilder](prog: Prog): Either[Err, Prog] = {
    Right(prog)
  }

}
