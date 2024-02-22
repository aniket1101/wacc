.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
 push rbp
 # push {rbx, r12, r13, r14}
 sub rsp, 32
 mov qword ptr [rsp], rbx
 mov qword ptr [rsp + 8], r12
 mov qword ptr [rsp + 16], r13
 mov qword ptr [rsp + 24], r14
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 1
 mov r12, rax
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 3
 mov r12, rax
 mov rax, 1
 mov r14, rax
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 2
 mov r13, rax
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
 call _println
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 0
 # pop {rbx, r12, r13, r14}
 mov rbx, qword ptr [rsp]
 mov r12, qword ptr [rsp + 8]
 mov r13, qword ptr [rsp + 16]
 mov r14, qword ptr [rsp + 24]
 add rsp, 32
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