.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov qword ptr [rsp + 16], scratchReg3
	mov rbp, rsp
	mov rax, 5
	mov scratchReg2, rax
	mov rax, 2
	mov scratchReg3, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret
