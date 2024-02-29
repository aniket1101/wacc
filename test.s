.intel_syntax noprefix
.globl main
.section .rodata
	.int 9
.L.str0:
	.asciz "incorrect"
	.int 7
.L.str1:
	.asciz "correct"
.text
main:
	push rbp
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	mov rax, 13
	mov r12, rax
	mov rax, 37
	mov r13, rax
	mov rax, r12
	mov rbx, r13
	cmp rbx, rax
	setl al
	movsx rax, al
	cmp rax, 1
	je .L0
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	jmp .L1

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

.section .rodata
	.int 0
.L._println_str0:
	.asciz ""
.text
_println:
	push rbp
	mov rbp, rsp
	and rsp, -16
	lea rdi, [rip + .L._println_str0]
	call puts@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.L0:
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	jmp .L1

.L1:
	mov rax, 13
	mov r12, rax
	mov rax, 37
	mov r13, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret
