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
	mov rax, 0
	mov rdi, rax
	mov rax, 0
	mov rsi, rax
	mov rax, 1
	mov rcx, rax
	mov rax, 4
	mov r8, rax
	mov rax, 2
	mov r9, rax
	mov rax, 3
	mov qword ptr [rbp + 16], rax
	mov rax, 7
	mov qword ptr [rbp + 24], rax
	mov rax, 4
	mov qword ptr [rbp + 32], rax
	call wacc_f
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
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

wacc_f:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov rbp, rsp
	mov rax, rcx
	mov rbx, r8
	add eax, ebx
	jo _errOverflow
	movsx rax, eax
	mov r12, rax
	mov rax, r9
	mov r10, qword ptr [rbp + 16]
	imul eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov r13, rax
	mov rax, qword ptr [rbp + 24]
	mov r10, qword ptr [rbp + 32]
	sub eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov r14, rax
	mov rax, r12
	mov r10, r13
	mov r11, r14
	imul r10d, r11d
	jo _errOverflow
	movsx r10, r10d
	add eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
