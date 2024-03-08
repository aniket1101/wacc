.intel_syntax noprefix
.globl main
.section .rodata
	.int 22
.L.str0:
	.asciz "An example integer is "
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	mov rax, 1
	mov rdi, rax
	mov rax, 6
	mov rsi, rax
	call wacc_random.randint
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

wacc_random.randint:
	push rbp
	mov rbp, rsp
	and rsp, -16
	sub rsp, 16
	mov dword ptr [rbp - 4], edi
	mov dword ptr [rbp - 8], esi
	mov edi, 0
	call time@PLT
	mov edi, eax
	call srand@PLT
	call rand@PLT
	mov edi, dword ptr [rbp - 4]
	mov esi, dword ptr [rbp - 8]
	add esi, 1
	jo _errOverflow
	movsx rsi, esi
	mov edx, esi
	sub edx, edi
	jo _errOverflow
	movsx rdx, edx
	lea ecx, dword ptr [rdx]
	cmp ecx, 0
	je _errDivZero
	cdq
	idiv ecx
	mov eax, edi
	add eax, edx
	jo _errOverflow
	movsx rax, eax
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
	.int 40
.L._errDivZero_str0:
	.asciz "fatal error: division or modulo by zero\n"
.text
_errDivZero:
	and rsp, -16
	lea rdi, [rip + .L._errDivZero_str0]
	call _prints
	mov dil, -1
	call exit@plt
