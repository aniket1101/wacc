.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r14
	mov rbp, rsp
	mov rax, 19
	mov r11, rax
	mov rax, r11
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

_exit:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret
