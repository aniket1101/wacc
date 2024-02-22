.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
 .int 9
.L.str0:
 .asciz "incorrect"
# length of .L.str1
 .int 7
.L.str1:
 .asciz "correct"
.text
main:
 push rbp
 # push {rbx, r12}
 sub rsp, 16
 mov qword ptr [rsp], rbx
 mov qword ptr [rsp + 8], r12
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 13
 mov r12, rax
 cmp r12, 13
 je .L0
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
 jmp .L1
.L0:
 cmp r12, 5
 jg .L2
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
 jmp .L3
.L2:
 cmp r12, 10
 jl .L4
 cmp r12, 12
 jg .L6
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
 jmp .L7
.L6:
 cmp r12, 13
 jg .L8
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str1]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
 jmp .L9
.L8:
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
.L9:
.L7:
 jmp .L5
.L4:
 # Stack pointer unchanged, no stack allocated arguments
 lea rax, [rip + .L.str0]
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _prints
 call _println
.L5:
.L3:
.L1:
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