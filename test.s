.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 48
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov qword ptr [rsp + 16], scratchReg3
	mov qword ptr [rsp + 24], scratchReg4
	mov qword ptr [rsp + 32], scratchReg5
	mov qword ptr [rsp + 40], scratchReg6
	mov rbp, rsp
	mov rax, 1
	cmp rax, 1
	je .L0
	mov rax, 1
	cmp rax, 1
	je .L4
	mov rax, 4
	mov scratchReg6, rax
	jmp .L5
	jmp .L1

.L2:
	mov rax, 1
	mov scratchReg2, rax

.L3:
.L0:
	mov rax, 1
	cmp rax, 1
	je .L2
	mov rax, 2
	mov scratchReg3, rax
	jmp .L3

.L1:
	mov rax, 10
	mov scratchReg4, rax

.L4:
	mov rax, 3
	mov scratchReg5, rax

.L5:
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	mov scratchReg4, qword ptr [rsp + 24]
	mov scratchReg5, qword ptr [rsp + 32]
	mov scratchReg6, qword ptr [rsp + 40]
	add rsp, 48
	pop rbp
	ret
