.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov qword ptr [rsp + 16], scratchReg3
	mov qword ptr [rsp + 24], scratchReg4
	mov qword ptr [rsp + 32], scratchReg5
	mov rbp, rsp
	mov rax, 0
	mov scratchReg2, rax
	jmp .L0
	mov rax, 10
	mov scratchReg5, rax

.L1:
	mov rax, 1
	mov scratchReg3, rax
	mov rax, 5
	mov scratchReg4, rax

.L0:
	mov rax, scratchReg2
	cmp 1, rax

.L2:
	je .L1
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	mov scratchReg4, qword ptr [rsp + 24]
	mov scratchReg5, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
