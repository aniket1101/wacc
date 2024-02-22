.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 1
.L.str0:
	.asciz "-"
# length of .L.str1
	.int 0
.L.str1:
	.asciz ""
# length of .L.str2
	.int 3
.L.str2:
	.asciz "|  "
# length of .L.str3
	.int 1
.L.str3:
	.asciz " "
# length of .L.str4
	.int 3
.L.str4:
	.asciz " = "
# length of .L.str5
	.int 3
.L.str5:
	.asciz "  |"
# length of .L.str6
	.int 29
.L.str6:
	.asciz "Ascii character lookup table:"
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
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str6]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 13
	mov rdi, rax
	call wacc_printLine
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r12, rax
	mov rax, 32
	mov r13, rax
	jmp .L4
.L5:
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printMap
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r12, rax
	mov eax, r13d
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
.L4:
	cmp r13, 127
	jl .L5
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 13
	mov rdi, rax
	call wacc_printLine
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret

wacc_printLine:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	jmp .L0
.L1:
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
	mov eax, r12d
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
.L0:
	cmp r12, rdi
	jl .L1
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	pop rdi
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printMap:
	push rbp
	mov rbp, rsp
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
	cmp rdi, 100
	jl .L2
	jmp .L3
.L2:
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
.L3:
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str4]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	test rax, -128
	cmovne rsi, rax
	jne _errBadChar
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str5]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	pop rdi
	mov rax, 1
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
# length of .L._printc_str0
	.int 2
.L._printc_str0:
	.asciz "%c"
.text
_printc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov sil, dil
	lea rdi, [rip + .L._printc_str0]
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
# length of .L._errBadChar_str0
	.int 50
.L._errBadChar_str0:
	.asciz "fatal error: int %d is not ascii character 0-127 \n"
.text
_errBadChar:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errBadChar_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
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
