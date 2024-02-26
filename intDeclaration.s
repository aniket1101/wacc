.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r14
	mov rbp, rsp
	mov rax, 42
	mov rbx, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
