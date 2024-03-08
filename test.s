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
	mov edi, 16
	call _malloc
	mov rbx, rax
	add rbx, 4
	mov rax, 3
	mov dword ptr [rbx - 4], eax
	mov rax, 1
	mov dword ptr [rbx], eax
	mov rax, 2
	mov dword ptr [rbx + 4], eax
	mov rax, 3
	mov dword ptr [rbx + 8], eax
	mov r12, rbx
	mov r9, r12
	mov r10, 2
	mov rax, 3
	mov r12, rax
	call _arrStore4
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

.text
_malloc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call malloc@plt
	cmp rax, 0
	je _errOutOfMemory
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
	.int 27
.L._errOutOfMemory_str0:
	.asciz "fatal error: out of memory\n"
.text
_errOutOfMemory:
	and rsp, -16
	lea rdi, [rip + .L._errOutOfMemory_str0]
	call _prints
	mov dil, -1
	call exit@plt

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
	.int 42
.L._errOutOfBounds_str0:
	.asciz "fatal error: array index %d out of bounds\n"
.text
_errOutOfBounds:
	and rsp, -16
	lea rdi, [rip + .L._errOutOfBounds_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov dil, -1
	call exit@plt

.text
_arrStore4:
	push rbx
	cmp r10d, 0
	cmovl rdi, rsi
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rdi, r10
	jge _errOutOfBounds
	mov dword ptr [r9 + r10 * 4], esi
	pop rbx
	ret
