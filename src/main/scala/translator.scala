import ast._

// Translates ast to Intel x86 assembly code

object translator {
  private val INITIAL_CODE =
    """.intel_syntax noprefix
      |.globl main
      |.section .rodata
      |.text
      |main:
      | push rbp
      |	# push {rbx, r12}
      |	sub rsp, 16
      |	mov qword ptr [rsp], rbx
      |	mov qword ptr [rsp + 8], r12
      | mov qword ptr [rsp + 16], r13
      |	mov rbp, rsp
      |	# Stack pointer unchanged, no stack allocated variables
      |""".stripMargin.split("\n").toList

  private val FINAL_CODE =
    """ # Stack pointer unchanged, no stack allocated variables
      |	mov rax, 0
      |	# pop {rbx, r12}
      |	mov rbx, qword ptr [rsp]
      |	mov r12, qword ptr [rsp + 8]
      |	add rsp, 16
      |	pop rbp
      |	ret
      |""".stripMargin.split("\n").toList
  def translateProgram(prog: Prog): List[String] = {
    INITIAL_CODE ++ translateStatements(prog.stats).map({line => "\t" + line}) ++ FINAL_CODE
  }

  private def translateStatements(statements: List[Stat]): List[String] = {
    statements match {
      case Nil => // handle case when the list is empty
        List.empty[String]
      case stat :: stats => stat match {
        case Declaration(typ, x, y) => {
          evalRvalue(y) ++               // Evaluate y and save it to register %rax
          varDeclaration(typ, x) ++      // Store the value of %rax into a register for x
            translateStatements(stats)
        }
      }
    }
  }

  private def evalRvalue(rValue: RValue): List[String] = {
    rValue match {
      case IntLit(value) =>
        // Load integer literal
        List(s"mov %rax, $value")

      case BoolLit(value) =>
        // Load boolean literal
        val boolValue = if (value) 1 else 0
        List(s"mov %rax, $boolValue")

      case CharLit(value) =>
        // Load character literal
        List(s"mov %rax, '$value'")

      case StrLit(value) =>
        // Load string literal
        // Assuming data section with label 'str_lit' for string literals
        List(s"lea %rax, str_lit")
    }
  }

  private def varDeclaration(typ: Type, ident: Ident): List[String] = {
    List("mov r12, rax")
  }
}
