.intel_syntax noprefix
.globl main
.section .rodata
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
 mov rax, 1
 mov r12, rax
 mov rax, 0
 mov r13, rax
 # Stack pointer unchanged, no stack allocated arguments
 cmp r12, 1
 jne .L0
 cmp r13, 1
.L0:
 sete al
 movsx rax, al
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printb
 call _println
 # Stack pointer unchanged, no stack allocated arguments
 cmp r12, 1
 jne .L1
 mov rax, 1
 cmp rax, 1
.L1:
 sete al
 movsx rax, al
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printb
 call _println
 # Stack pointer unchanged, no stack allocated arguments
 cmp r13, 1
 jne .L2
 mov rax, 0
 cmp rax, 1
.L2:
 sete al
 movsx rax, al
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printb
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
# length of .L._printb_str0
 .int 5
.L._printb_str0:
 .asciz "false"
# length of .L._printb_str1
 .int 4
.L._printb_str1:
 .asciz "true"
# length of .L._printb_str2
 .int 4
.L._printb_str2:
 .asciz "%.*s"
.text
_printb:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 cmp dil, 0
 jne .L_printb0
 lea rdx, [rip + .L._printb_str0]
 jmp .L_printb1
.L_printb0:
 lea rdx, [rip + .L._printb_str1]
.L_printb1:
 mov esi, dword ptr [rdx - 4]
 lea rdi, [rip + .L._printb_str2]
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
