import Main.format
import ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._
class StatementTest extends AnyFlatSpec {
  "Parser" should "parse simple assignments" in {
    parser.parse(format("x = 42")) shouldBe Right(Prog(List(), Assign(Ident("x"), IntLit(42))))
  }

  it should "parse multiple assignments" in {
    parser.parse(format("x = 42; y = true; z = \"hello\"")) shouldBe
      Right(Prog(List(), Stmts(Assign(Ident("x"), IntLit(42)),
        Stmts(Assign(Ident("y"), BoolLit(true)),
          Assign(Ident("z"), StrLit("hello"))))))
  }

  it should "parse if statements" in {
    parser.parse(format("if x > 0 then skip else print(x) fi")) shouldBe
      Right(Prog(List(), IfStmt(GT(Ident("x"), IntLit(0)), Skip(), Print(Ident("x")))))
  }

  it should "parse while loops" in {
    parser.parse(format("while x > 0 do x = x - 1 done")) shouldBe
      Right(Prog(List(), WhileStmt(GT(Ident("x"), IntLit(0)), Assign(Ident("x"), Sub(Ident("x"), IntLit(1))))))
  }

  it should "parse begin-end blocks" in {
    parser.parse(format("begin x = 1 end")) shouldBe
      Right(Prog(List(),Begin(Assign(Ident("x"),IntLit(1)))))
  }
}
