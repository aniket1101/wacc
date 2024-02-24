.intel_syntax noprefix
.globl main
.section .rodata
	.int 11
.L.str0:
	.asciz "Hello World"
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	mov esi, qword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret
	mov rax, 0
	pop rbx
	pop rbp
	ret

_prints:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	mov esi, qword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret
