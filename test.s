.intel_syntax noprefix
.globl main
.section .rodata
<<<<<<< HEAD
	.int 20
.L.str0:
	.asciz "Can you count to 10?"
=======
	.int 25
.L.str0:
	.asciz "enter a character to echo"
>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
<<<<<<< HEAD
	mov rax, 1
=======
	mov rax, 0
	mov r12, rax
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	mov rax, r12
	mov rdi, rax
	call _readc
>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0
	mov r12, rax
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
<<<<<<< HEAD
	call _prints
=======
	call _printc
>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0
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
<<<<<<< HEAD
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
	mov rbx, 10
	cmp rax, rbx
	setle al
	movsx rax, al
	cmp rax, 1
	je .L1
	jmp .L2

.L1:
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	mov rax, r12
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	mov r12, rax
	jmp .L0

.L2:
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
=======
	.int 3
.L._readc_str0:
	.asciz " %c"
.text
_readc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	sub rsp, 16
	mov byte ptr [rsp], dil
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readc_str0]
	mov al, 0
	call scanf@plt
	movsx rax, byte ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
	.int 2
.L._printc_str0:
	.asciz "%c"
.text
_printc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov sil, dil
	lea rdi, [rip + .L._printc_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0
	pop rbp
	ret
