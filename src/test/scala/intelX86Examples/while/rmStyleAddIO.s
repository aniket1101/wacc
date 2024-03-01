.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 24
.L.str0:
	.asciz "Enter the first number: "
# length of .L.str1
	.int 25
.L.str1:
	.asciz "Enter the second number: "
# length of .L.str2
	.int 20
.L.str2:
	.asciz "Initial value of x: "
# length of .L.str3
	.int 3
.L.str3:
	.asciz "(+)"
# length of .L.str4
	.int 0
.L.str4:
	.asciz ""
# length of .L.str5
	.int 18
.L.str5:
	.asciz "final value of x: "
.text
main:
	push rbp
	# push {rbx, r12, r13}
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	mov rax, 0
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r12
	mov rdi, rax
	call _readi
	mov r11, rax
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r13
	mov rdi, rax
	call _readi
	mov r11, rax
	mov rax, r11
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	jmp .L0
.L1:
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	mov eax, r12d
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	mov eax, r13d
	sub eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
.L0:
	cmp r13, 0
	jg .L1
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str4]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str5]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
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

.section .rodata
# length of .L._readi_str0
	.int 2
.L._readi_str0:
	.asciz "%d"
.text
_readi:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	# RDI contains the "original" value of the destination of the read
	# allocate space on the stack to store the read: preserve alignment!
	# the passed default argument should be stored in case of EOF
	sub rsp, 16
	mov dword ptr [rsp], edi
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readi_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call scanf@plt
	movsx rax, dword ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._printi_str0
	.int 2
.L._printi_str0:
	.asciz "%d"
.text
_printi:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov esi, edi
	lea rdi, [rip + .L._printi_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._println_str0
	.int 0
.L._println_str0:
	.asciz ""
.text
_println:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._println_str0]
	call puts@plt
	mov rdi, 0
	call fflush@plt
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
