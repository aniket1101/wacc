// import Main.format
// import ast._
// import org.scalatest.flatspec.AnyFlatSpec
// import org.scalatest.matchers.should.Matchers._

// class ExpressionTest extends AnyFlatSpec {

//   "Parser" should "be able to parse declarations" in {
//     parser.parse(format("int x = 13")) shouldBe Right(Prog(List(), Declaration(IntType(), Ident("x"), IntLit(13))))
//   }

//   it should "parse unary operators" in {
//     parser.parse(format("int x = + 13")) shouldBe Right(Prog(List(), Declaration(IntType(), Ident("x"), IntLit(13))))
//     parser.parse(format("int x = - 13")) shouldBe Right(Prog(List(), Declaration(IntType(), Ident("x"), IntLit(-13))))
//   }

//   it should "parse correct precedence for +/*" in {
//     parser.parse(format("int z = 4 * y + 5 * x")) shouldBe Right(Prog(List(), Declaration(IntType(), Ident("z"), Add(Mul(IntLit(4), Ident("y")), Mul(IntLit(5), Ident("x"))))))
//   }
//   it should "allow parentheses to override" in {
//     parser.parse(format("int a = (4 + y) * (5 + x)")) shouldBe Right(Prog(List(), Declaration(IntType(),Ident("a"),Mul(Add(IntLit(4),Ident("y")),Add(IntLit(5),Ident("x"))))))
//   }

//   "expr" should "parse additions in a left-associative way" in {
//     parser.parse(format("int b = x + 5 + z")) shouldBe Right(Prog(List(), Declaration(IntType(), Ident("b"), Add(Add(Ident("x"), IntLit(5)), Ident("z")))))
//   }

//   it should "parse right-associatively in the presence of parentheses" in {
//     parser.parse(format("int c = x + (5 + z)")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("c"),Add(Ident("x"),Add(IntLit(5),Ident("z"))))))
//   }

//   it should "not allow for missing terms" in {
//     parser.parse(format("int a = 5 +")) shouldBe a[Left[_, _]]
//     parser.parse(format("int b = x + y +")) shouldBe a[Left[_, _]]
//   }

//   it should "not interleave with parentheses" in {
//     parser.parse(format("int c = (4 +) 5")) shouldBe a[Left[_, _]]
//   }

//   "term" should "parse multiplications in a left-associative way" in {
//     parser.parse(format("int d = x * 5 * z")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("d"),Mul(Mul(Ident("x"),IntLit(5)),Ident("z")))))
//   }

//   it should "parse right-associatively in the presence of parentheses" in {
//     parser.parse(format("int e = x * (5 * z)")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("e"),Mul(Ident("x"),Mul(IntLit(5),Ident("z"))))))
//   }

//   it should "not allow for missing terms" in {
//     parser.parse(format("int x = * 5")) shouldBe a[Left[_, _]]
//     parser.parse(format("int y = x * y *")) shouldBe a[Left[_, _]]
//   }

//   it should "not interleave with parentheses" in {
//     parser.parse(format("int x = (4 *) 5")) shouldBe a[Left[_, _]]
//   }

//   it should "parse inequalities in a non-infix way" in {
//     parser.parse(format("bool val = -12 < 12")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("val"),LT(IntLit(-12),IntLit(12)))))
//     parser.parse(format("bool val = 12 > -12")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("val"),GT(IntLit(12),IntLit(-12)))))
//     parser.parse(format("bool val = 12 <= 12")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("val"),LTE(IntLit(12),IntLit(12)))))
//   }

//   it should "parse logical AND" in {
//     parser.parse(format("bool cond = true && false")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("cond"),And(BoolLit(true),BoolLit(false)))))
//     parser.parse(format("bool cond = true && (true || false)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("cond"),And(BoolLit(true),Or(BoolLit(true),BoolLit(false))))))
//   }

//   it should "parse logical OR" in {
//     parser.parse(format("bool c = true || false")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("c"),Or(BoolLit(true),BoolLit(false)))))
//     parser.parse(format("bool c = (true || false) && true")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("c"),And(Or(BoolLit(true),BoolLit(false)),BoolLit(true)))))
//   }

//   it should "parse equality check" in {
//     parser.parse(format("bool p = x == y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("p"),Eq(Ident("x"),Ident("y")))))
//     parser.parse(format("bool q = (x == y) && (y != z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("q"),And(Eq(Ident("x"),Ident("y")),NEq(Ident("y"),Ident("z"))))))
//   }

//   it should "parse inequality check" in {
//     parser.parse(format("bool q = x != y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("q"),NEq(Ident("x"),Ident("y")))))
//     parser.parse(format("bool q = (x != y) || (y == z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("q"),Or(NEq(Ident("x"),Ident("y")),Eq(Ident("y"),Ident("z"))))))
//   }

//   it should "parse greater than check" in {
//     parser.parse(format("bool a = x > y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("a"),GT(Ident("x"),Ident("y")))))
//     parser.parse(format("bool a = (x > y) && (y <= z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("a"),And(GT(Ident("x"),Ident("y")),LTE(Ident("y"),Ident("z"))))))
//   }

//   it should "parse greater than or equal to check" in {
//     parser.parse(format("bool b = x >= y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("b"),GTE(Ident("x"),Ident("y")))))
//     parser.parse(format("bool b = (x >= y) || (y < z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("b"),Or(GTE(Ident("x"),Ident("y")),LT(Ident("y"),Ident("z"))))))
//   }

//   it should "parse less than check" in {
//     parser.parse(format("bool c = x < y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("c"),LT(Ident("x"),Ident("y")))))
//     parser.parse(format("bool c = (x < y) && (y >= z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("c"),And(LT(Ident("x"),Ident("y")),GTE(Ident("y"),Ident("z"))))))
//   }

//   it should "parse less than or equal to check" in {
//     parser.parse(format("bool d = x <= y")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("d"),LTE(Ident("x"),Ident("y")))))
//     parser.parse(format("bool d = (x <= y) || (y > z)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("d"),Or(LTE(Ident("x"),Ident("y")),GT(Ident("y"),Ident("z"))))))
//   }

//   it should "parse logical NOT" in {
//     parser.parse(format("bool cond = !true")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("cond"),Not(BoolLit(true)))))
//     parser.parse(format("bool cond = !(true && false)")) shouldBe Right(Prog(List(),Declaration(BoolType(),Ident("cond"),Not(And(BoolLit(true),BoolLit(false))))))
//   }

//   it should "parse negation" in {
//     parser.parse(format("int y = -x")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("y"),Neg(Ident("x")))))
//     parser.parse(format("int y = -(-x)")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("y"),Neg(Neg(Ident("x"))))))
//   }

//   it should "parse length function" in {
//     parser.parse(format("""int length = len("x")""")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("length"),Len(StrLit("x")))))
//     parser.parse(format("int length = len(x + y)")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("length"),Len(Add(Ident("x"),Ident("y"))))))
//   }

//   it should "parse ordinal function" in {
//     parser.parse(format("""int a = ord("x")""")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("a"),Ord(StrLit("x")))))
//     parser.parse(format("int a = ord(x * y)")) shouldBe Right(Prog(List(),Declaration(IntType(),Ident("a"),Ord(Mul(Ident("x"),Ident("y"))))))
//   }

//   it should "parse character function" in {
//     parser.parse(format("char l = chr(x)")) shouldBe Right(Prog(List(),Declaration(CharType(),Ident("l"),Chr(Ident("x")))))
//     parser.parse(format("char l = chr(x + y)")) shouldBe Right(Prog(List(),Declaration(CharType(),Ident("l"),Chr(Add(Ident("x"),Ident("y"))))))
//   }

//   it should "not allow invalid binary operators" in {
//     parser.parse(format("x @ 5")) shouldBe a[Left[_, _]]
//     parser.parse(format("x & y")) shouldBe a[Left[_, _]]
//     parser.parse(format("x ^ y")) shouldBe a[Left[_, _]]
//   }

//   it should "not allow incomplete expressions" in {
//     parser.parse(format("x *")) shouldBe a[Left[_, _]]
//     parser.parse(format("x * (y +)")) shouldBe a[Left[_, _]]
//     parser.parse(format("(x + y")) shouldBe a[Left[_, _]]
//   }

//   it should "not allow invalid unary operators" in {
//     parser.parse(format("x !")) shouldBe a[Left[_, _]]
//     parser.parse(format("-")) shouldBe a[Left[_, _]]
//   }

//   it should "not allow incomplete function calls" in {
//     parser.parse(format("len(")) shouldBe a[Left[_, _]]
//     parser.parse(format("chr(x + )")) shouldBe a[Left[_, _]]
//   }

//   it should "not allow mismatched parentheses" in {
//     parser.parse(format("(x + y")) shouldBe a[Left[_, _]]
//     parser.parse(format("x * (y + 3")) shouldBe a[Left[_, _]]
//     parser.parse(format("len(x + y")) shouldBe a[Left[_, _]]
//   }

//   it should "not allow invalid variable names" in {
//     parser.parse(format("123x")) shouldBe a[Left[_, _]]
//     parser.parse(format("var$")) shouldBe a[Left[_, _]]
//     parser.parse(format("val#")) shouldBe a[Left[_, _]]
//   }
// }

