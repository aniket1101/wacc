.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	jmp .L9

.L9:
	mov rax, 0
	cmp rax, 1
	je .L10
	jmp .L11

.L10:
	jmp .L11

.L11:
	mov rax, 0
	pop rbx
	pop rbp
	ret
