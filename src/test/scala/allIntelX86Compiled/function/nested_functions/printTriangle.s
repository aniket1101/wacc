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
 mov rax, 8
 mov rdi, rax
 call wacc_f
 mov r11, rax
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r11
 mov r12, rax
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 0
 # pop {rbx, r12}
 mov rbx, qword ptr [rsp]
 mov r12, qword ptr [rsp + 8]
 add rsp, 16
 pop rbp
 ret

wacc_f:
 push rbp
 # push {r12, r13}
 sub rsp, 16
 mov qword ptr [rsp], r12
 mov qword ptr [rsp + 8], r13
 mov rbp, rsp
 cmp rdi, 0
 je .L0
 # Stack pointer unchanged, no stack allocated variables
 mov rax, rdi
 mov r12, rax
 jmp .L2
.L3:
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
 sub eax, 1
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 mov r12, rax
.L2:
 cmp r12, 0
 jg .L3
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
 push rdi
 # Set up R11 as a temporary second base pointer for the caller saved things
 mov r11, rsp
 # Stack pointer unchanged, no stack allocated arguments
 mov eax, edi
 sub eax, 1
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 mov rdi, rax
 call wacc_f
 mov r11, rax
 # Stack pointer unchanged, no stack allocated arguments
 pop rdi
 mov rax, r11
 mov r13, rax
 # Stack pointer unchanged, no stack allocated variables
 jmp .L1
.L0:
.L1:
 mov rax, 0
 # reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
 mov rsp, rbp
 # pop {r12, r13}
 mov r12, qword ptr [rsp]
 mov r13, qword ptr [rsp + 8]
 add rsp, 16
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
