import Main.format
import ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

class PairTest extends AnyFlatSpec{
  "Parser" should "parse pair types" in {
    parser.parse(format("pair(int, bool) p = foo")) shouldBe Right(Prog(List(), Declaration(PairType(IntType(),BoolType()),Ident("p"),Ident("foo"))))
    parser.parse(format("pair(int[][], bool[]) p = foo")) shouldBe Right(Prog(List(), Declaration(PairType(ArrayType(ArrayType(IntType())),ArrayType(BoolType())),Ident("p"),Ident("foo"))))
    parser.parse(format("pair(pair(int, int)[][], bool) p = foo")) shouldBe Right(Prog(List(), Declaration(PairType(ArrayType(ArrayType(PairType(IntType(),IntType()))),BoolType()),Ident("p"),Ident("foo"))))
  }

  it should "parse pair definitions" in {
    parser.parse(format("pair(int, int) p = null")) shouldBe Right(Prog(List(), Declaration(PairType(IntType(),IntType()),Ident("p"),PairLiter())))
    parser.parse(format("pair(int, int) p = newpair(1, 2)")) shouldBe Right(Prog(List(), Declaration(PairType(IntType(),IntType()),Ident("p"),NewPair(IntLit(1),IntLit(2)))))
    parser.parse(format("int p = fst f")) shouldBe Right(Prog(List(), Declaration(IntType(),Ident("p"),PairFst(Ident("f")))))
    parser.parse(format("int p = snd s")) shouldBe Right(Prog(List(), Declaration(IntType(),Ident("p"),PairSnd(Ident("s")))))
  }
}
