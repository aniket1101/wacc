.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov rax, 122
	mov r12, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
