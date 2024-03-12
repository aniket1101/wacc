.intel_syntax noprefix
.globl main
.section .rodata
	.int 61
.L.str0:
	.asciz "This program calculates the nth fibonacci number recursively."
	.int 42
.L.str1:
	.asciz "Please enter n (should not be too large): "
	.int 15
.L.str2:
	.asciz "The input n is "
	.int 28
.L.str3:
	.asciz "The nth fibonacci number is "
.text
main:
	push rbp
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	call _println
	lea rax, [rip + .L.str1]
	mov rdi, rax
	call _prints
	mov rax, 0
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call _readi
	mov r12, rax
	lea rax, [rip + .L.str2]
	mov rdi, rax
	call _prints
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	lea rax, [rip + .L.str3]
	mov rdi, rax
	call _prints
	mov rax, r12
	mov rdi, rax
	call wacc_fibonacci
	mov r13, rax
	mov rax, r13
	mov rdi, rax
	call _printi
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret

wacc_fibonacci:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov rbp, rsp
	mov rax, rdi
	mov rbx, 1
	cmp rax, rbx
	setle al
	movsx rax, al
	cmp rax, 1
	je .L0
	jmp .L1

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

.L0:
	mov rax, rdi
	jmp .L1

.L1:
	mov rax, rdi
	mov r10, 1
	sub eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rdi, rax
	call wacc_fibonacci
	mov r12, rax
	mov rax, rdi
	mov r10, 2
	sub eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rdi, rax
	call wacc_fibonacci
	mov r13, rax
	mov rax, r12
	mov r10, r13
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
.L._readi_str0:
	.asciz "%d"
.text
_readi:
	push rbp
	mov rbp, rsp
	and rsp, -16
	sub rsp, 16
	mov dword ptr [rsp], edi
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readi_str0]
	mov al, 0
	call scanf@plt
	movsx rax, dword ptr [rsp]
	add rsp, 16
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
