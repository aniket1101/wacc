.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 24
.L.str0:
	.asciz "Using fixed-point real: "
# length of .L.str1
	.int 3
.L.str1:
	.asciz " / "
# length of .L.str2
	.int 3
.L.str2:
	.asciz " * "
# length of .L.str3
	.int 3
.L.str3:
	.asciz " = "
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
	mov rax, 10
	mov r12, rax
	mov rax, 3
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
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_intToFixedPoint
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, r13
	mov rsi, rax
	call wacc_divideByInt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, r13
	mov rsi, rax
	call wacc_multiplyByInt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_fixedPointToIntRoundNear
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r15, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
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

wacc_q:
	push rbp
	mov rbp, rsp
	mov rax, 14
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_power:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 1
	mov r12, rax
	jmp .L0
.L1:
	mov eax, r12d
	imul eax, edi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	mov eax, esi
	sub eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rsi, rax
.L0:
	cmp rsi, 0
	jg .L1
	mov rax, r12
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_f:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_q
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 2
	mov rdi, rax
	mov rax, r12
	mov rsi, rax
	call wacc_power
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r13, rax
	mov rax, r13
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_intToFixedPoint:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	mov eax, edi
	imul eax, r12d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_fixedPointToIntRoundDown:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	mov eax, edi
	cmp r12d, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv r12d
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_fixedPointToIntRoundNear:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	cmp rdi, 0
	jge .L2
	mov rbx, 2
	mov eax, r12d
	cmp ebx, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv ebx
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rbx
	mov eax, edi
	sub eax, ebx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	cmp r12d, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv r12d
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	jmp .L3
.L2:
	mov rbx, 2
	mov eax, r12d
	cmp ebx, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv ebx
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rbx
	mov eax, edi
	add eax, ebx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	cmp r12d, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv r12d
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
.L3:
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_add:
	push rbp
	mov rbp, rsp
	mov eax, edi
	add eax, esi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_subtract:
	push rbp
	mov rbp, rsp
	mov eax, edi
	sub eax, esi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_addByInt:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r12, rax
	mov eax, esi
	imul eax, r12d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rbx
	mov eax, edi
	add eax, ebx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_subtractByInt:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r12, rax
	mov eax, esi
	imul eax, r12d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rbx
	mov eax, edi
	sub eax, ebx
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_multiply:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r12, rax
	mov eax, edi
	imul eax, esi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	cmp r12d, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv r12d
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_multiplyByInt:
	push rbp
	mov rbp, rsp
	mov eax, edi
	imul eax, esi
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_divide:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r12, rax
	mov eax, edi
	imul eax, r12d
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov eax, eax
	cmp esi, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv esi
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_divideByInt:
	push rbp
	mov rbp, rsp
	mov eax, edi
	cmp esi, 0
	je _errDivZero
	# sign extend EAX into EDX
	cdq
	idiv esi
	mov eax, eax
	mov eax, eax
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

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
# length of .L._errDivZero_str0
	.int 40
.L._errDivZero_str0:
	.asciz "fatal error: division or modulo by zero\n"
.text
_errDivZero:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errDivZero_str0]
	call _prints
	mov dil, -1
	call exit@plt

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
