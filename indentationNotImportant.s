.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	jmp .L0

.L0:
	mov rax, 0
	cmp rax, 1
	je .L1
	jmp .L2

.L1:
	jmp .L2

.L2:
	mov rax, 0
	pop rbx
	pop rbp
	ret
