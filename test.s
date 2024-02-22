.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov rbp, rsp
	mov rax, 1
	mov scratchReg2, rax
	mov rax, scratchReg2
	cmp rax, 1
	je .L0
	jmp .L1

.L0:
.L1:
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
