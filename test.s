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
	mov rax, 3
	mov scratchReg2, rax
	mov rax, 2
	mov paramReg1, rax
	mov rax, 3
	mov paramReg2, rax
	mov rax, 4
	mov paramReg3, rax
	call wacc_foo
	mov scratchReg3, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret

wacc_wacc_foo:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov qword ptr [rsp + 16], scratchReg3
	mov qword ptr [rsp + 24], scratchReg4
	mov qword ptr [rsp + 32], scratchReg5
	mov rbp, rsp
	mov rax, paramReg1
	mov scratchReg2, rax
	mov rax, paramReg2
	mov scratchReg3, rax
	mov rax, paramReg3
	mov scratchReg4, rax
	mov rax, 23
	mov scratchReg5, rax
	mov rax, scratchReg5
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	mov scratchReg3, qword ptr [rsp + 16]
	mov scratchReg4, qword ptr [rsp + 24]
	mov scratchReg5, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
