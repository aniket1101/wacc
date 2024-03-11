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
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call wacc_inc
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	mov rax, r12
	mov rdi, rax
	call wacc_inc
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call wacc_inc
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call wacc_inc
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

wacc_inc:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov rax, rdi
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
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
