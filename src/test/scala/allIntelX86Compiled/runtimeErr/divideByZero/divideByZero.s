.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
 push rbp
 # push {rbx, r12}
 sub rsp, 16
 mov qword ptr [rsp], rbx
 mov qword ptr [rsp + 8], r12
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 128
 test rax, -128
 cmovne rsi, rax
 jne _errBadChar
 push rax
 pop rax
 mov rax, rax
 mov r12, rax
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 0
 # pop {rbx, r12}
 mov rbx, qword ptr [rsp]
 mov r12, qword ptr [rsp + 8]
 add rsp, 16
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
