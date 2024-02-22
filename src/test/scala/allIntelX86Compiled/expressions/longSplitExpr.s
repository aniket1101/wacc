.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	# push {rbx, r12, r13, r14, r15}
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov eax, 1
	add eax, 2
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	mov eax, 3
	add eax, 4
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
	mov eax, 5
	add eax, 6
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r14, rax
	mov eax, 7
	add eax, 8
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r15, rax
	mov eax, 9
	add eax, 10
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rcx, rax
	mov eax, 11
	add eax, 12
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rdx, rax
	mov eax, 13
	add eax, 14
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rsi, rax
	mov eax, 15
	add eax, 16
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	mov rax, 17
	mov r8, rax
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov eax, r12d
	add eax, r13d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, r14d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, r15d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, ecx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, edx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, esi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, edi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	add eax, r8d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _exit
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13, r14, r15}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret

.section .rodata
# length of .L._prints_str0
	.int 4
.L._prints_str0:
	.asciz "%.*s"
.text
_prints:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov rdx, rdi
	mov esi, dword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

_exit:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._errOverflow_str0
	.int 52
.L._errOverflow_str0:
	.asciz "fatal error: integer overflow or underflow occurred\n"
.text
_errOverflow:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOverflow_str0]
	call _prints
	mov dil, -1
	call exit@plt
