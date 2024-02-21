.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, -1
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	mov rax, 0
	pop rbx
	pop rbp
	ret

_exit:
	push rsp
	mov rsp, rbp
	and rbp, -16
	call exit@plt
	mov rbp, rsp
	pop rsp
	ret
