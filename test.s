.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, 0
	pop rbx
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

wacc_f:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, rdi
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	pop rbx
	pop rbp
	ret
