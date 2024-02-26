.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r18
	mov rbp, rsp
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
