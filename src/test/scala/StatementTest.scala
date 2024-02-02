// import Main.format
// import ast._
// import org.scalatest.flatspec.AnyFlatSpec
// import org.scalatest.matchers.should.Matchers._
// class StatementTest extends AnyFlatSpec {
//   "Parser" should "parse simple assignments" in {
//     parser.parse(format("x = 42")) shouldBe Right(Prog(List(), Assign(Ident("x"), IntLit(42))))
//     parser.parse(format("y = x + 1")) shouldBe Right(Prog(List(), Assign(Ident("y"), Add(Ident("x"), IntLit(1)))))
//   }

//   it should "parse multiple assignments" in {
//     parser.parse(format("x = 42; y = true; z = \"hello\"")) shouldBe
//       Right(Prog(List(), Stats(Assign(Ident("x"), IntLit(42)),
//         Stats(Assign(Ident("y"), BoolLit(true)),
//           Assign(Ident("z"), StrLit("hello"))))))
//   }

//   it should "parse if statements" in {
//     parser.parse(format("if x > 0 then skip else print(x) fi")) shouldBe
//       Right(Prog(List(), If(GT(Ident("x"), IntLit(0)), Skip(), Print(Ident("x")))))
//     parser.parse(format("if x > 0 then if y < 10 then skip else print(y) fi else skip fi")) shouldBe
//       Right(Prog(List(), If(GT(Ident("x"), IntLit(0)),
//         If(LT(Ident("y"), IntLit(10)), Skip(), Print(Ident("y"))),
//         Skip())))
//   }

//   it should "parse if statement with multiple statements" in {
//     parser.parse(format("if x > 0 then y = y + 1; z = z * 2 else print(x) fi")) shouldBe
//       Right(Prog(List(), If(GT(Ident("x"), IntLit(0)),
//         Stats(Assign(Ident("y"), Add(Ident("y"), IntLit(1))), Assign(Ident("z"), Mul(Ident("z"), IntLit(2)))),
//         Print(Ident("x")))))
//     parser.parse(format("if x > 0 then if y < 10 then y = y + 1; z = z * 2 else print(y) fi else print(x) fi")) shouldBe
//       Right(Prog(List(), If(GT(Ident("x"), IntLit(0)),
//         If(LT(Ident("y"), IntLit(10)),
//           Stats(Assign(Ident("y"), Add(Ident("y"), IntLit(1))), Assign(Ident("z"), Mul(Ident("z"), IntLit(2)))),
//         Print(Ident("y"))),
//         Print(Ident("x"))))
//     )
//   }

//   it should "parse while loops" in {
//     parser.parse(format("while x > 0 do x = x - 1 done")) shouldBe
//       Right(Prog(List(), While(GT(Ident("x"), IntLit(0)), Assign(Ident("x"), Sub(Ident("x"), IntLit(1))))))
//     parser.parse(format("while x > 0 do while y < 10 do y = y + 1 done done")) shouldBe
//       Right(Prog(List(), While(GT(Ident("x"), IntLit(0)),
//         While(LT(Ident("y"), IntLit(10)), Assign(Ident("y"), Add(Ident("y"), IntLit(1)))))))
//   }

//   it should "parse while loop with multiple statements" in {
//     parser.parse(format("while x > 0 do y = y + 1; z = z * 2 done")) shouldBe
//       Right(Prog(List(), While(GT(Ident("x"), IntLit(0)),
//         Stats(Assign(Ident("y"), Add(Ident("y"), IntLit(1))), Assign(Ident("z"), Mul(Ident("z"), IntLit(2)))))))
//     parser.parse(format("while x > 0 do while y < 10 do y = y + 1; z = z * 2 done; x = x - 1 done")) shouldBe
//       Right(Prog(List(), While(GT(Ident("x"), IntLit(0)),
//         Stats(While(LT(Ident("y"), IntLit(10)),
//           Stats(Assign(Ident("y"), Add(Ident("y"), IntLit(1))), Assign(Ident("z"), Mul(Ident("z"), IntLit(2))))),
//           Assign(Ident("x"), Sub(Ident("x"), IntLit(1)))))))
//   }

//   it should "parse begin-end blocks" in {
//     parser.parse(format("begin x = 1 end")) shouldBe
//       Right(Prog(List(),Begin(Assign(Ident("x"),IntLit(1)))))
//     parser.parse(format("begin int x = 1 + 2; println x end")) shouldBe
//       Right(Prog(List(),Begin(Stats(Declaration(IntType(),Ident("x"),Add(IntLit(1),IntLit(2))),Println(Ident("x"))))))
//   }

//   it should "parse skip statement" in {
//     parser.parse(format("skip")) shouldBe Right(Prog(List(), Skip()))
//   }

//   it should "parse read statement" in {
//     parser.parse(format("read x")) shouldBe Right(Prog(List(), Read(Ident("x"))))
//   }

//   it should "parse free statement" in {
//     parser.parse(format("free y")) shouldBe Right(Prog(List(), Free(Ident("y"))))
//   }

//   it should "parse return statement" in {
//     parser.parse(format("return 42")) shouldBe Right(Prog(List(), Return(IntLit(42))))
//   }

//   it should "parse exit statement" in {
//     parser.parse(format("exit 1")) shouldBe Right(Prog(List(), Exit(IntLit(1))))
//   }

//   it should "parse print statement" in {
//     parser.parse(format("print(x)")) shouldBe Right(Prog(List(), Print(Ident("x"))))
//   }

//   it should "parse println statement" in {
//     parser.parse(format("println(x)")) shouldBe Right(Prog(List(), Println(Ident("x"))))
//   }

// }
