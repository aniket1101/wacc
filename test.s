.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp - 0], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov rax, 4
	push rax
	mov rax, 8
	push rax
	pop rax
	mov rsi, rax
	pop rax
	mov rdi, rax
	call wacc_f
	mov r12, rax
	mov rax, 0
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret

wacc_f:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp - 0], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	sub rsp, 24
	mov qword ptr [rsp - 0], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	mov rax, rdi
	mov rbx, rsi
	add eax, ebx
	jo _errOverflow
	movsx rax, eax
	push rax
	mov rax, rdi
	mov r10, rsi
	sub eax, r10d
	jo _errOverflow
	movsx rax, eax
	push rax
	mov rax, rdi
	mov r10, rsi
	imul eax, r10d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rdx, rax
	pop rax
	mov rsi, rax
	pop rax
	mov rdi, rax
	call wacc_g
	mov r12, rax
	mov rdx, qword ptr [rsp - 0]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	mov rax, r12
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
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

wacc_g:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp - 0], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov rax, rdi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rsi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, rdx
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, 0
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
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
