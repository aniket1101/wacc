.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov dword ptr [rsp], rbx
	mov dword ptr [rsp + 8], varReg2
	mov rbp, rsp
	mov rax, 7
	mov scratchReg1, 9
	mod scratchReg1, rax
	mov varReg2, rax
	mov rax, 0
	mov rbx, dword ptr [rsp]
	mov varReg2, dword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
