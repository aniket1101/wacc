import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class ExpressionTest extends AnyFlatSpec {

    "Parser" should "be able to parse no assignments" in {
        parser.parse("13") shouldBe Right(Prog(IntLit(13)))
        parser.parse("x") shouldBe Right(Prog(Ident("x")))
    }

    it should "parse correct precedence for +/*" in {
        parser.parse("4 * y + 5 * x") shouldBe Right(Prog(Add(Mul(IntLit(4), Ident("y")), Mul(IntLit(5), Ident("x")))))
    }
    it should "allow parentheses to override" in {
        parser.parse("(4 + y) * (5 + x)") shouldBe Right(Prog(Mul(Add(IntLit(4), Ident("y")), Add(IntLit(5), Ident("x")))))
    }

    "expr" should "parse additions in a left-associative way" in {
        parser.parse("x + 5 + z") shouldBe Right(Prog(Add(Add(Ident("x"), IntLit(5)), Ident("z"))))
    }

    it should "parse right-associatively in the presence of parentheses" in {
        parser.parse("x + (5 + z)") shouldBe Right(Prog(Add(Ident("x"), Add(IntLit(5), Ident("z")))))
    }

    it should "not allow for missing terms" in {
        parser.parse("+ 5") shouldBe a [Left[_, _]]
        parser.parse("x + y +") shouldBe a [Left[_, _]]
    }

    it should "not interleave with parentheses" in {
        parser.parse("(4 +) 5") shouldBe a [Left[_, _]]
    }

    "term" should "parse multiplications in a left-associative way" in {
        parser.parse("x * 5 * z") shouldBe Right(Prog(Mul(Mul(Ident("x"), IntLit(5)), Ident("z"))))
    }

    it should "parse right-associatively in the presence of parentheses" in {
        parser.parse("x * (5 * z)") shouldBe Right(Prog(Mul(Ident("x"), Mul(IntLit(5), Ident("z")))))
    }

    it should "not allow for missing terms" in {
        parser.parse("* 5") shouldBe a [Left[_, _]]
        parser.parse("x * y *") shouldBe a [Left[_, _]]
    }

    it should "not interleave with parentheses" in {
        parser.parse("(4 *) 5") shouldBe a [Left[_, _]]
    }

    it should "parse inequalities in a non-infix way" in {
        parser.parse("-12 < 12") shouldBe Right(Prog(LT(Neg(IntLit(12)),IntLit(12))))
        parser.parse("12 > -12") shouldBe Right(Prog(GT(IntLit(12),Neg(IntLit(12)))))
        parser.parse("12 <= 12") shouldBe Right(Prog(LTE(IntLit(12),IntLit(12))))
    }

    it should "parse logical AND" in {
        parser.parse("true && false") shouldBe Right(Prog(And(Ident("true"), Ident("false"))))
        parser.parse("true && (true || false)") shouldBe Right(Prog(And(Ident("true"), Or(Ident("true"), Ident("false")))))
    }

    it should "parse logical OR" in {
        parser.parse("true || false") shouldBe Right(Prog(Or(Ident("true"), Ident("false"))))
        parser.parse("(true || false) && true") shouldBe Right(Prog(And(Or(Ident("true"), Ident("false")), Ident("true"))))
    }

    it should "parse equality check" in {
        parser.parse("x == y") shouldBe Right(Prog(Eq(Ident("x"), Ident("y"))))
        parser.parse("(x == y) && (y != z)") shouldBe Right(Prog(And(Eq(Ident("x"), Ident("y")), NEq(Ident("y"), Ident("z")))))
    }

    it should "parse inequality check" in {
        parser.parse("x != y") shouldBe Right(Prog(NEq(Ident("x"), Ident("y"))))
        parser.parse("(x != y) || (y == z)") shouldBe Right(Prog(Or(NEq(Ident("x"), Ident("y")), Eq(Ident("y"), Ident("z")))))
    }

    it should "parse greater than check" in {
        parser.parse("x > y") shouldBe Right(Prog(GT(Ident("x"), Ident("y"))))
        parser.parse("(x > y) && (y <= z)") shouldBe Right(Prog(And(GT(Ident("x"), Ident("y")), LTE(Ident("y"), Ident("z")))))
    }

    it should "parse greater than or equal to check" in {
        parser.parse("x >= y") shouldBe Right(Prog(GTE(Ident("x"), Ident("y"))))
        parser.parse("(x >= y) || (y < z)") shouldBe Right(Prog(Or(GTE(Ident("x"), Ident("y")), LT(Ident("y"), Ident("z")))))
    }

    it should "parse less than check" in {
        parser.parse("x < y") shouldBe Right(Prog(LT(Ident("x"), Ident("y"))))
        parser.parse("(x < y) && (y >= z)") shouldBe Right(Prog(And(LT(Ident("x"), Ident("y")), GTE(Ident("y"), Ident("z")))))
    }

    it should "parse less than or equal to check" in {
        parser.parse("x <= y") shouldBe Right(Prog(LTE(Ident("x"), Ident("y"))))
        parser.parse("(x <= y) || (y > z)") shouldBe Right(Prog(Or(LTE(Ident("x"), Ident("y")), GT(Ident("y"), Ident("z")))))
    }

    it should "parse logical NOT" in {
        parser.parse("!true") shouldBe Right(Prog(Not(Ident("true"))))
        parser.parse("!(true && false)") shouldBe Right(Prog(Not(And(Ident("true"), Ident("false")))))
    }

    it should "parse negation" in {
        parser.parse("-x") shouldBe Right(Prog(Neg(Ident("x"))))
        parser.parse("-(-x)") shouldBe Right(Prog(Neg(Neg(Ident("x")))))
    }

    it should "parse length function" in {
        parser.parse("len(x)") shouldBe Right(Prog(Len(Ident("x"))))
        parser.parse("len(x + y)") shouldBe Right(Prog(Len(Add(Ident("x"), Ident("y")))))
    }

    it should "parse ordinal function" in {
        parser.parse("ord(x)") shouldBe Right(Prog(Ord(Ident("x"))))
        parser.parse("ord(x * y)") shouldBe Right(Prog(Ord(Mul(Ident("x"), Ident("y")))))
    }

    it should "parse character function" in {
        parser.parse("chr(x)") shouldBe Right(Prog(Chr(Ident("x"))))
        parser.parse("chr(x + y)") shouldBe Right(Prog(Chr(Add(Ident("x"), Ident("y")))))
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

