.intel_syntax noprefix
.globl main
.section .rodata
.section .rodata
  .int 12
.L.str0:
  .asciz "Hello World!"
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
