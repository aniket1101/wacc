.intel_syntax noprefix
.globl main
.section .rodata
	.int 2
.L.str0:
	.asciz "no"
.text
main:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	call _println
	mov rax, 5
	mov r13, rax
	mov rax, 5
	mov rbx, r13
	imul eax, ebx
	jo _errOverflow
	movsx rax, eax
	add eax, 70
	jo _errOverflow
	movsx rax, eax
	mov r14, rax
	mov rax, r14
	add eax, 100
	jo _errOverflow
	movsx rax, eax
	mov r14, rax
	mov rax, r14
	mov rdi, rax
	call _printi
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	add rsp, 32
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
