.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
 .int 4
.L.str0:
 .asciz " is "
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
 mov rax, 97
 mov r12, rax
 mov rax, 99
 mov r13, rax
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r12
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printc
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
 call _println
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r13
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printi
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r13
 test rax, -128
 cmovne rsi, rax
 jne _errBadChar
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printc
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