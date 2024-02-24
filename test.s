.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], varReg2
	mov qword ptr [rsp + 16], varReg3
	mov qword ptr [rsp + 24], varReg4
	mov rbp, rsp
	mov rax, 5
	mov varReg2, rax
	mov rax, 7
	mov varReg3, rax
	mov rax, varReg2
	mov scratchReg3, varReg3
	add scratchReg3, rax
	mov scratchReg2, 3
	mov scratchReg1, 4
	add scratchReg1, scratchReg2
	imul scratchReg2, rax
	mov scratchReg1, 3
	mov scratchReg1, 9
	add scratchReg1, scratchReg1
	imul scratchReg1, rax
	mov varReg4, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov varReg2, qword ptr [rsp + 8]
	mov varReg3, qword ptr [rsp + 16]
	mov varReg4, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
