.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov qword ptr [rsp + 16], scratchReg3
	mov qword ptr [rsp + 24], scratchReg4
	mov rbp, rsp
	mov rax, 3
	mov scratchReg2, rax
	mov rax, 6
	mov scratchReg3, rax
	mov rax, 10
	mov scratchReg4, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	mov scratchReg4, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
