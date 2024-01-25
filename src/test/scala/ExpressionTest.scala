import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class ExpressionTest extends AnyFlatSpec {

    "Parser" should "be able to parse no assignments" in {
        parser.parse("13") shouldBe Right(Prog(Val(13)))
        parser.parse("x") shouldBe Right(Prog(Var("x")))
    }

    it should "parse correct precedence for +/*" in {
        parser.parse("4 * y + 5 * x") shouldBe Right(Prog(Add(Mul(Val(4), Var("y")), Mul(Val(5), Var("x")))))
    }
    it should "allow parentheses to override" in {
        parser.parse("(4 + y) * (5 + x)") shouldBe Right(Prog(Mul(Add(Val(4), Var("y")), Add(Val(5), Var("x")))))
    }

    "expr" should "parse additions in a left-associative way" in {
        parser.parse("x + 5 + z") shouldBe Right(Prog(Add(Add(Var("x"), Val(5)), Var("z"))))
    }

    it should "parse right-associatively in the presence of parentheses" in {
        parser.parse("x + (5 + z)") shouldBe Right(Prog(Add(Var("x"), Add(Val(5), Var("z")))))
    }

    it should "not allow for missing terms" in {
        parser.parse("+ 5") shouldBe a [Left[_, _]]
        parser.parse("x + y +") shouldBe a [Left[_, _]]
    }

    it should "not interleave with parentheses" in {
        parser.parse("(4 +) 5") shouldBe a [Left[_, _]]
    }

    "term" should "parse multiplications in a left-associative way" in {
        parser.parse("x * 5 * z") shouldBe Right(Prog(Mul(Mul(Var("x"), Val(5)), Var("z"))))
    }

    it should "parse right-associatively in the presence of parentheses" in {
        parser.parse("x * (5 * z)") shouldBe Right(Prog(Mul(Var("x"), Mul(Val(5), Var("z")))))
    }

    it should "not allow for missing terms" in {
        parser.parse("* 5") shouldBe a [Left[_, _]]
        parser.parse("x * y *") shouldBe a [Left[_, _]]
    }

    it should "not interleave with parentheses" in {
        parser.parse("(4 *) 5") shouldBe a [Left[_, _]]
    }

    it should "parse inequalities in a non-infix way" in {
        parser.parse("-12 < 12") shouldBe Right(Prog(LT(Neg(Val(12)),Val(12))))
        parser.parse("12 > -12") shouldBe Right(Prog(GT(Val(12),Neg(Val(12)))))
        parser.parse("12 <= 12") shouldBe Right(Prog(LTE(Val(12),Val(12))))
    }

    it should "parse logical AND" in {
        parser.parse("true && false") shouldBe Right(Prog(And(Var("true"), Var("false"))))
        parser.parse("true && (true || false)") shouldBe Right(Prog(And(Var("true"), Or(Var("true"), Var("false")))))
    }

    it should "parse logical OR" in {
        parser.parse("true || false") shouldBe Right(Prog(Or(Var("true"), Var("false"))))
        parser.parse("(true || false) && true") shouldBe Right(Prog(And(Or(Var("true"), Var("false")), Var("true"))))
    }

    it should "parse equality check" in {
        parser.parse("x == y") shouldBe Right(Prog(Eq(Var("x"), Var("y"))))
        parser.parse("(x == y) && (y != z)") shouldBe Right(Prog(And(Eq(Var("x"), Var("y")), NEq(Var("y"), Var("z")))))
    }

    it should "parse inequality check" in {
        parser.parse("x != y") shouldBe Right(Prog(NEq(Var("x"), Var("y"))))
        parser.parse("(x != y) || (y == z)") shouldBe Right(Prog(Or(NEq(Var("x"), Var("y")), Eq(Var("y"), Var("z")))))
    }

    it should "parse greater than check" in {
        parser.parse("x > y") shouldBe Right(Prog(GT(Var("x"), Var("y"))))
        parser.parse("(x > y) && (y <= z)") shouldBe Right(Prog(And(GT(Var("x"), Var("y")), LTE(Var("y"), Var("z")))))
    }

    it should "parse greater than or equal to check" in {
        parser.parse("x >= y") shouldBe Right(Prog(GTE(Var("x"), Var("y"))))
        parser.parse("(x >= y) || (y < z)") shouldBe Right(Prog(Or(GTE(Var("x"), Var("y")), LT(Var("y"), Var("z")))))
    }

    it should "parse less than check" in {
        parser.parse("x < y") shouldBe Right(Prog(LT(Var("x"), Var("y"))))
        parser.parse("(x < y) && (y >= z)") shouldBe Right(Prog(And(LT(Var("x"), Var("y")), GTE(Var("y"), Var("z")))))
    }

    it should "parse less than or equal to check" in {
        parser.parse("x <= y") shouldBe Right(Prog(LTE(Var("x"), Var("y"))))
        parser.parse("(x <= y) || (y > z)") shouldBe Right(Prog(Or(LTE(Var("x"), Var("y")), GT(Var("y"), Var("z")))))
    }

    it should "parse logical NOT" in {
        parser.parse("!true") shouldBe Right(Prog(Not(Var("true"))))
        parser.parse("!(true && false)") shouldBe Right(Prog(Not(And(Var("true"), Var("false")))))
    }

    it should "parse negation" in {
        parser.parse("-x") shouldBe Right(Prog(Neg(Var("x"))))
        parser.parse("-(-x)") shouldBe Right(Prog(Neg(Neg(Var("x")))))
    }

    it should "parse length function" in {
        parser.parse("len(x)") shouldBe Right(Prog(Len(Var("x"))))
        parser.parse("len(x + y)") shouldBe Right(Prog(Len(Add(Var("x"), Var("y")))))
    }

    it should "parse ordinal function" in {
        parser.parse("ord(x)") shouldBe Right(Prog(Ord(Var("x"))))
        parser.parse("ord(x * y)") shouldBe Right(Prog(Ord(Mul(Var("x"), Var("y")))))
    }

    it should "parse character function" in {
        parser.parse("chr(x)") shouldBe Right(Prog(Chr(Var("x"))))
        parser.parse("chr(x + y)") shouldBe Right(Prog(Chr(Add(Var("x"), Var("y")))))
    }

    it should "not allow invalid binary operators" in {
        parser.parse("x @ 5") shouldBe a [Left[_, _]]
        parser.parse("x & y") shouldBe a [Left[_, _]]
        parser.parse("x ^ y") shouldBe a [Left[_, _]]
    }

    it should "not allow incomplete expressions" in {
        parser.parse("x *") shouldBe a [Left[_, _]]
        parser.parse("x * (y +)") shouldBe a [Left[_, _]]
        parser.parse("(x + y") shouldBe a [Left[_, _]]
    }

    it should "not allow invalid unary operators" in {
        parser.parse("x !") shouldBe a [Left[_, _]]
        parser.parse("-") shouldBe a [Left[_, _]]
    }

    it should "not allow incomplete function calls" in {
        parser.parse("len(") shouldBe a [Left[_, _]]
        parser.parse("chr(x + )") shouldBe a [Left[_, _]]
    }

    it should "not allow mismatched parentheses" in {
        parser.parse("(x + y") shouldBe a [Left[_, _]]
        parser.parse("x * (y + 3") shouldBe a [Left[_, _]]
        parser.parse("len(x + y") shouldBe a [Left[_, _]]
    }

    it should "not allow invalid variable names" in {
        parser.parse("123x") shouldBe a [Left[_, _]]
        parser.parse("var$") shouldBe a [Left[_, _]]
        parser.parse("val#") shouldBe a [Left[_, _]]
    }
}

