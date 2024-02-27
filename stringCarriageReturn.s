.intel_syntax noprefix
.globl main
.section .rodata
.section .rodata
  .int 15
.L.str0:
  .asciz "Hello  World!\n"
             .text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r15
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov r15, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r15, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
