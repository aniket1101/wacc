.intel_syntax noprefix
.globl main
.section .rodata
	.int 16
.L.str0:
	.asciz "Assertion Failed"
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov rax, 1
	mov rdi, rax
	call wacc_assert
	mov r12, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

.section .rodata
	.int 4
.L._prints_str0:
	.asciz "%.*s"
.text
_prints:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	mov esi, dword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
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

.L0:
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	mov rax, -1
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	jmp .L1

.L1:
	mov rax, rdi

wacc_assert:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, rdi
	cmp rax, 1
	setne al
	movsx rax, al
	cmp rax, 1
	je .L0
	jmp .L1
	pop rbx
	pop rbp
	ret
