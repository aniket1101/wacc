.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
<<<<<<<< HEAD:src/test/scala/intelX86Examples/while/max.s
	.int 12
.L.str0:
	.asciz "max value = "
.text
main:
	push rbp
	# push {rbx, r12, r13, r14}
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
========
	.int 24
.L.str0:
	.asciz "enter an integer to echo"
.text
main:
	push rbp
	# push {rbx, r12}
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
>>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0:src/test/scala/intelX86Examples/IO/read/echoInt.s
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 1
	mov r12, rax
<<<<<<<< HEAD:src/test/scala/intelX86Examples/while/max.s
	mov rax, 10
	mov r13, rax
	mov rax, 17
	mov r14, rax
	jmp .L0
.L1:
	mov eax, r13d
	sub eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
	mov eax, r14d
	sub eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r14, rax
	mov eax, r12d
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
.L0:
	cmp r14, 0
	setg al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L2
	cmp r13, 0
	setg al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L2:
	je .L1
========
>>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0:src/test/scala/intelX86Examples/IO/read/echoInt.s
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
<<<<<<<< HEAD:src/test/scala/intelX86Examples/while/max.s
========
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r12
	mov rdi, rax
	call _readi
	mov r11, rax
	mov rax, r11
	mov r12, rax
>>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0:src/test/scala/intelX86Examples/IO/read/echoInt.s
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
<<<<<<<< HEAD:src/test/scala/intelX86Examples/while/max.s
	# pop {rbx, r12, r13, r14}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	add rsp, 32
========
	# pop {rbx, r12}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
>>>>>>>> 2353e0df6031e3cbb1c9e2b0575c6de5588958a0:src/test/scala/intelX86Examples/IO/read/echoInt.s
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
