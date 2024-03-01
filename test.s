<<<<<<< Updated upstream
=======
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
	mov edi, 7
	call _malloc
	mov rbx, rax
	lea rbx, qword ptr [rbx + 4]
	mov rax, 3
	mov dword ptr [rbx - 4], eax
	mov rax, 102
	mov byte ptr [rbx], al
	mov rax, 111
	mov byte ptr [rbx + 1], al
	mov rax, 111
	mov byte ptr [rbx + 2], al
	mov r12, rbx
	mov rax, r12
	mov rdi, rax
	call _prints
	call _println
	mov edi, 7
	call _malloc
	mov rbx, rax
	lea rbx, qword ptr [rbx + 4]
	mov rax, 3
	mov dword ptr [rbx - 4], eax
	mov rax, 98
	mov byte ptr [rbx], al
	mov rax, 97
	mov byte ptr [rbx + 1], al
	mov rax, 114
	mov byte ptr [rbx + 2], al
	mov r12, rbx
	mov rax, r12
	mov rdi, rax
	call _prints
	call _println
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
>>>>>>> Stashed changes
