.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rbp, 16
	mov qword ptr [rbp], rbx
	mov qword ptr [rbp + 8], r12
	mov qword ptr [rbp + 16], r13
	mov rbp, rsp
	mov rax, 4
	mov reg, 5
	add rax, reg
	mov reg1, rax
	mov rax, reg1
	mov reg, 3
	add rax, reg
	mov reg1, rax
	mov rax, 5
	mov reg1, rax
	mov rax, 0
	mov qword ptr [rbp - 16], r13
	mov qword ptr [rbp - 8], r12
	mov qword ptr [rbp], rbx
	add -16, rbp
	pop rbp
	ret
