import backend.IR._
import backend.IRRegisters._
import backend.Size._
import backend._
import frontend.ast._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers._

import scala.collection.mutable

class BackendIRTests extends AnyFlatSpec {

  val nullPos = (-1, -1)

  "Backend" should "be able to handle declare" in {
    val decInt = new Declaration(IntType()(nullPos), Ident("myInt")(nullPos), IntLit(42)(nullPos))(nullPos)
    val ir = new IRTranslator(new Prog(List.empty, List(decInt))(nullPos), mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> CharType()(nullPos)))

    ir.translate().length shouldBe 1
    ir.translate().head.label.name == "main"
    ir.translate().head.instructions.length == 13
  }

  "Backend" should "be able to handle arithmetic operations" in {
    val addExpr = Add(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val subExpr = Sub(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val mulExpr = Mul(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val divExpr = Div(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)

    val decIntX = new Declaration(IntType()(nullPos), Ident("x")(nullPos), IntLit(10)(nullPos))(nullPos)
    val decIntY = new Declaration(IntType()(nullPos), Ident("y")(nullPos), IntLit(5)(nullPos))(nullPos)

    val ir = new IRTranslator(new Prog(List.empty, List(decIntX, decIntY))(nullPos), mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))

    val translatedIR = ir.translate()
    translatedIR.length shouldBe 1
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 17
  }

  "IRTranslator" should "correctly translate function declarations" in {
    val funcDecl = Func(IntType()(nullPos), Ident("myFunction")(nullPos), List.empty, List.empty)(nullPos)
    val prog = Prog(List(funcDecl), List.empty)(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map.empty)
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 2
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.isEmpty shouldBe false
  }

  it should "translate char variable declarations" in {
    val varDecl = Declaration(CharType()(nullPos), Ident("myVar")(nullPos), CharLit('c')(nullPos))(nullPos)
    val prog = Prog(List.empty, List(varDecl))(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 1
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 15
  }

  it should "translate array literals with negatives" in {
    val arrayLit = ArrayLit(List(IntLit(-2)(nullPos), IntLit(-56)(nullPos), IntLit(-76)(nullPos)))(nullPos)
    val decl = Declaration(ArrayType(IntType()(nullPos))(nullPos), Ident("myArray")(nullPos), arrayLit)(nullPos)
    val prog = Prog(List.empty, List(decl))(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 5
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 26
  }

  "Backend" should "be able to handle declare big integers" in {
    val decInt = new Declaration(IntType()(nullPos), Ident("myInt")(nullPos), IntLit(999999)(nullPos))(nullPos)
    val ir = new IRTranslator(new Prog(List.empty, List(decInt))(nullPos), mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> CharType()(nullPos)))

    ir.translate().length shouldBe 1
    ir.translate().head.label.name == "main"
    ir.translate().head.instructions.length == 13
  }

  "Backend" should "be able to handle arithmetic expressions with negatives" in {
    val addExpr = Add(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val subExpr = Sub(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val mulExpr = Mul(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)
    val divExpr = Div(Ident("x")(nullPos), Ident("y")(nullPos))(nullPos)

    val decIntX = new Declaration(IntType()(nullPos), Ident("x")(nullPos), IntLit(-5)(nullPos))(nullPos)
    val decIntY = new Declaration(IntType()(nullPos), Ident("y")(nullPos), IntLit(-10)(nullPos))(nullPos)

    val ir = new IRTranslator(new Prog(List.empty, List(decIntX, decIntY))(nullPos), mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))

    val translatedIR = ir.translate()
    translatedIR.length shouldBe 1
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 17
  }

  "IRTranslator" should "correctly translate function calls" in {
    val funcDecl = Func(IntType()(nullPos), Ident("myFunction")(nullPos), List.empty, List.empty)(nullPos)
    val prog = Prog(List(funcDecl), List.empty)(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map.empty)
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 2
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.isEmpty shouldBe false
  }

  it should "translate variable assigments for negatives" in {
    val varDecl = Declaration(IntType()(nullPos), Ident("myVar")(nullPos), IntLit(-9999)(nullPos))(nullPos)
    val prog = Prog(List.empty, List(varDecl))(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 1
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 15
  }

  it should "translate array elements normal" in {
    val arrayLit = ArrayLit(List(IntLit(1)(nullPos), IntLit(2)(nullPos), IntLit(3)(nullPos)))(nullPos)
    val decl = Declaration(ArrayType(IntType()(nullPos))(nullPos), Ident("myArray")(nullPos), arrayLit)(nullPos)
    val prog = Prog(List.empty, List(decl))(nullPos)

    val irTranslator = new IRTranslator(prog, mutable.Map("main-x" -> IntType()(nullPos), "main-y" -> IntType()(nullPos)))
    val translatedIR = irTranslator.translate()

    translatedIR.length shouldBe 5
    val mainBlock = translatedIR.head
    mainBlock.label.name shouldBe "main"
    mainBlock.instructions.length shouldBe 26
  }
}