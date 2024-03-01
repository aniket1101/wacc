.intel_syntax noprefix
.globl main
.section .rodata
	.int 35
.L.str0:
	.asciz "The first 20 fibonacci numbers are:"
	.int 2
.L.str1:
	.asciz ", "
	.int 3
.L.str2:
	.asciz "..."
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 0
	mov r13, rax
	mov rax, 1
	mov r14, rax
	mov rax, 0
	mov r15, rax
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	jmp .L0

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

.section .rodata
	.int 2
.L._printi_str0:
	.asciz "%d"
.text
_printi:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov esi, edi
	lea rdi, [rip + .L._printi_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
	.int 52
.L._errOverflow_str0:
	.asciz "fatal error: integer overflow or underflow occurred\n"
.text
_errOverflow:
	and rsp, -16
	lea rdi, [rip + .L._errOverflow_str0]
	call _prints
	mov dil, -1
	call exit@plt

.L0:
	mov rax, r12
	mov rbx, 20
	cmp rax, rbx
	setl al
	movsx rax, al
	cmp rax, 1
	je .L1
	jmp .L2

.L1:
	mov rax, r13
	mov rdi, rax
	call _printi
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	mov r15, r13
	mov r15, rax
	mov r13, r14
	mov r13, rax
	mov r14, r15
	mov rbx, r14
	add r14d, ebx
	jo _errOverflow
	movsx r14, r14d
	mov r14, rax
	mov r12, r12
	add r12d, 1
	jo _errOverflow
	movsx r12, r12d
	mov r12, rax
	jmp .L0

.L2:
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
