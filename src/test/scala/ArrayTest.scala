// import Main.format
// import ast._
// import org.scalatest.flatspec.AnyFlatSpec
// import org.scalatest.matchers.should.Matchers._
// class ArrayTest extends AnyFlatSpec {
//   "Parser" should "parse array declarations" in {
//     parser.parse(format("int[] a = []")) shouldBe Right(Prog(List(), Declaration(ArrayType(IntType()),Ident("a"),ArrayLit(List()))))
//     parser.parse(format("int[] b = [1]")) shouldBe Right(Prog(List(), Declaration(ArrayType(IntType()),Ident("b"),ArrayLit(List(IntLit(1))))))
//     parser.parse(format("int[] c = [1, 2, 3]")) shouldBe Right(Prog(List(), Declaration(ArrayType(IntType()),Ident("c"),ArrayLit(List(IntLit(1), IntLit(2), IntLit(3))))))
//   }

//   it should "parse array assignments" in {
//     parser.parse(format("a[1] = 2 + 3")) shouldBe Right(Prog(List(), Assign(ArrayElem(Ident("a"),List(IntLit(1))),Add(IntLit(2),IntLit(3)))))
//     parser.parse(format("a[4 * 5 - 2] = 0")) shouldBe Right(Prog(List(), Assign(ArrayElem(Ident("a"),List(Sub(Mul(IntLit(4),IntLit(5)),IntLit(2)))),IntLit(0))))
//   }

//   it should "parse nested arrays" in {
//     parser.parse(format("bool[] a = [0, 0, 1]; bool[][] b = [a]")) shouldBe Right(Prog(List(), Stats(Declaration(ArrayType(BoolType()),Ident("a"),ArrayLit(List(IntLit(0), IntLit(0), IntLit(1)))), Declaration(ArrayType(ArrayType(BoolType())),Ident("b"),ArrayLit(List(Ident("a")))))))
//     parser.parse(format("a[0][1] = 0")) shouldBe Right(Prog(List(), Assign(ArrayElem(Ident("a"),List(IntLit(0), IntLit(1))),IntLit(0))))
//   }
// }
