.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
 .int 53
.L.str0:
 .asciz "Printing an array variable gives an address, such as "
.text
main:
 push rbp
 # push {rbx, r12}
 sub rsp, 16
 mov qword ptr [rsp], rbx
 mov qword ptr [rsp + 8], r12
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 # 3 element array
 mov edi, 16
 call _malloc
 mov r11, rax
 # array pointers are shifted forwards by 4 bytes (to account for size)
 mov r11, r11
 add r11, 4
 mov rax, 3
 mov dword ptr [r11 - 4], eax
 mov rax, 1
 mov dword ptr [r11], eax
 mov rax, 2
 mov dword ptr [r11 + 4], eax
 mov rax, 3
 mov dword ptr [r11 + 8], eax
 mov rax, r11
 mov r12, rax
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r12
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printp
 call _println
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 0
 # pop {rbx, r12}
 mov rbx, qword ptr [rsp]
 mov r12, qword ptr [rsp + 8]
 add rsp, 16
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
# length of .L._printp_str0
 .int 2
.L._printp_str0:
 .asciz "%p"
.text
_printp:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 mov rsi, rdi
 lea rdi, [rip + .L._printp_str0]
 # on x86, al represents the number of SIMD registers used as variadic arguments
 mov al, 0
 call printf@plt
 mov rdi, 0
 call fflush@plt
 mov rsp, rbp
 pop rbp
 ret

_malloc:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 call malloc@plt
 cmp rax, 0
 je _errOutOfMemory
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
# length of .L._errOutOfMemory_str0
 .int 27
.L._errOutOfMemory_str0:
 .asciz "fatal error: out of memory\n"
.text
_errOutOfMemory:
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 lea rdi, [rip + .L._errOutOfMemory_str0]
 call _prints
 mov dil, -1
 call exit@plt