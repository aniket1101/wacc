import ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class FunctionTest extends AnyFlatSpec {
  "parser" should "parse a function with no parameters" in {
    val input =
      """
        |begin
        |  int getNumber() is
        |    return 123
        |  end
        |
        |  skip
        |end
      """.stripMargin
    parser.parse(input) shouldBe Right(Prog(List(Func(IntType(),Ident("getNumber"),List(),Return(IntLit(123)))),Skip()))
  }

  it should "parse calls with various numbers of arguments" in {
    val input =
      """
        |begin
        |  int result = call foo();
        |  string name = call bar('A');
        |  bool cond = call foobar(true, "True")
        |end
      """.stripMargin
    parser.parse(input) shouldBe Right(Prog(List(),Stmts(Declaration(IntType(),Ident("result"),Call(Ident("foo"),ArgList(List()))),Stmts(Declaration(StringType(),Ident("name"),Call(Ident("bar"),ArgList(List(CharLit('A'))))),Declaration(BoolType(),Ident("cond"),Call(Ident("foobar"),ArgList(List(BoolLit(true), StrLit("True")))))))))
  }

  it should "parse a simple function declaration and call" in {
    val input =
      """
        |begin
        |  int add(int x, int y) is
        |    return x + y
        |  end
        |
        |  int result = call add(3, 4)
        |end
      """.stripMargin
    parser.parse(input) shouldBe Right(Prog(List(Func(IntType(), Ident("add"), List(Param(IntType(), Ident("x")), Param(IntType(), Ident("y"))), Return(Add(Ident("x"), Ident("y"))))), Declaration(IntType(), Ident("result"), Call(Ident("add"), ArgList(List(IntLit(3), IntLit(4)))))))
  }
}
