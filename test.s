.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	SubImm(Immediate(16),rbp)
	mov [rbp + 0], rbx
	mov [rbp + 8], r12
	mov [rbp + 16], r13
	mov rbp, rsp
	mov rax, 4
	mov reg2, 5
	add rax reg2
	mov reg1, rax
	mov rax, reg1
	mov reg2, 3
	add rax reg2
	mov reg1, rax
	mov rax, 5
	mov reg1, rax
	mov rax, 0
	add Immediate(16) rbp
	pop rbp
	ret
