.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbx
	sub rsp, 16
	mov dword ptr [rsp + 8], rbx
	mov dword ptr [rsp + 8], r12
	mov rbx, rsp
	mov rax, 7
	mov r12, rax
	mov rax, 0
	mov rbx, dword ptr [rsp + 8]
	mov r12, dword ptr [rsp + 8]
	add rsp, 16
	pop rbx
	ret
