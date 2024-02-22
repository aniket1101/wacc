package backend

import backend.registers.{ALL_REGS, EAX, EDX, Register}
import frontend.ast._

import scala.collection.mutable.ListBuffer

// Translates ast to Intel x86 assembly code

object translator {

  private val INITIAL_CODE =
    """.intel_syntax noprefix
      |.globl main
      |.section .rodata
      |.text
      |main:
      |	# Stack pointer unchanged, no stack allocated variables
      |""".stripMargin.split("\n").toList

  private val FINAL_CODE =
    """ # Stack pointer unchanged, no stack allocated variables
      |	ret
      |""".stripMargin.split("\n").toList

  def translateProgram(prog: Prog): List[String] = {
    INITIAL_CODE ++ translateStatements(prog.stats, ListBuffer(ALL_REGS: _*)).map({line => "\t" + line}) ++ FINAL_CODE
  }

  private def translateStatements(statements: List[Stat], freeRegs: ListBuffer[Register]): List[String] = {
    statements match {
      case Nil => // handle case when the list is empty
        List.empty[String]
      case stat :: stats => stat match {
        case Declaration(typ, x, y) => {
          val reg: Register = freeRegs.remove(0)
          evalRvalue(y, freeRegs) ++ List(s"mov $reg ${freeRegs.head}") ++ translateStatements(stats, freeRegs)
        }
      }
    }
  }

  private def evalRvalue(rValue: RValue, freeRegs: ListBuffer[Register]): List[String] = {
    rValue match {
      case expr: Expr => evalExpr(expr, freeRegs)
    }
  }

  private def evalExpr(exp: Expr, freeRegs: ListBuffer[Register]): List[String] = {
    exp match {
      // Unary Operators
      case unOpp: UnOpp =>
        val t: Register = freeRegs.head

        // Evaluate the expression
        val expr = evalExpr(unOpp.x, freeRegs)

        // Assembly instructions
        val assemblyInstructions = unOpp match {
          case _: Not => List(
            s"mov eax, $t", // Move the value of t to EAX
            s"not eax", // Perform bitwise NOT operation on EAX
            s"mov $t, eax" // Move the result back to t
          )
          case _: Neg => List(
            s"mov eax, $t", // Move the value of t to EAX
            s"neg eax", // Perform two's complement negation on EAX
            s"mov $t, eax" // Move the result back to t
          )
          // Add more cases for Len, Ord, Chr as needed
          case _: Len => ???
          case _: Ord => ???
          case _: Chr => ???
        }

        expr ::: assemblyInstructions


      // Binary Operators
      case binOpp: BinOpp => {
        val t1: Register = freeRegs.head
        val t2: Register = freeRegs(1)

        // Evaluate expressions
        val expr1 = evalExpr(binOpp.x, freeRegs)
        val expr2 = evalExpr(binOpp.y, freeRegs.tail)

        // Assembly instructions
        val assemblyInstructions = binOpp match {
          // Arithmetic
          case _: Add => List(
            s"mov $EAX, $t1",
            s"add $t1, $t2",
            s"mov $t1, $EAX"
          )
          case _: Sub => List(
            s"mov $EAX, $t1",
            s"sub $EAX, $t2",
            s"mov $t1, $EAX"
          )
          case _: Mul => List(
            s"mov $EAX, $t1",
            s"imul $EAX, $t2",
            s"mov $t1, $EAX"
          )
          case _: Div => List(
            s"mov $EAX, $t1",
            s"idiv $t2",
            s"mov $t1, $EAX"
          )
          case _: Mod => List(
            s"mov $EAX, $t1",
            s"idiv $t2",
            s"mov $t1, $EDX"
          )

          // Comparing Operators
          // TODO Currently we assume that we are doing comparison on ints
          case _: GT => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"setg al",
            s"movzx $t1, al"
          )

          case _: GTE => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"setge al",
            s"movzx $t1, al"
          )

          case _: LT => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"setl al",
            s"movzx $t1, al"
          )

          case _: LTE => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"setle al",
            s"movzx $t1, al"
          )

          case _: Eq => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"sete al",
            s"movzx $t1, al"
          )

          case _: NEq => List(
            s"mov $EAX, $t1",
            s"cmp $EAX, $t2",
            s"setne al",
            s"movzx $t1, al",
          )
          case _: And => List(
            s"mov $EAX, $t1",
            s"and $EAX, $t2",
            s"mov $t1, $EAX"
          )

          case _: Or => List(
            s"mov $EAX, $t1",
            s"or $EAX, $t2",
            s"mov $t1, $EAX"
          )
        }
        expr1 ::: expr2 ::: assemblyInstructions
      }

      case atom: Atom =>
        val t: Register = freeRegs.head
        List(atom match {
          case IntLit(value) => s"mov $t, $value"
          case BoolLit(value) => s"mov $t, ${if (value) 1 else 0}"
          case CharLit(value) => s"mov $t, '$value'"
          case StrLit(value) => s"mov $t, \"$value\""
          case PairLiter() => s"mov $t, null"
        })

      case Ident(value) => ???
      case ArrayElem(name, exprs) => ???
    }
  }
}
