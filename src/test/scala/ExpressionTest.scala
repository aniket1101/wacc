import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._
import parsley.{Failure, Success}

class ExpressionTest extends AnyFlatSpec {

  "Parser" should "parse integers" in {
    parser.parse("3") shouldBe Success(3)
    parser.parse("0") shouldBe Success(0)
    parser.parse("-2") shouldBe Success(-2)
    parser.parse("3.14") shouldBe Failure(
      """(line 1, column 2):
        |  unexpected "."
        |  expected "+", "-", digit, or end of input
        |  >3.14
        |    ^""".stripMargin)
  }

  it should "add integers" in {
    parser.parse("1 + 3") shouldBe Success(4)
    parser.parse("1 + 5 + 7") shouldBe Success(13)
  }

  it should "subtract integers" in {
    parser.parse("1 - 3") shouldBe Success(-2)
    parser.parse("10 - 3 - 2") shouldBe Success(5)
  }

  it should "handle brackets" in {
    parser.parse("(1 + 2)") shouldBe Success(3)
    parser.parse("7 + ((3 - 4))") shouldBe Success(6)
    parser.parse("(4 + 5") shouldBe Failure(
      """(line 1, column 7):
        |  unexpected end of input
        |  expected ")", "+", "-", or digit
        |  >(4 + 5
        |         ^""".stripMargin)
  }

}
