%define SYS_WRITE      1
%define SYS_EXIT       60
%define STDOUT         1
%define EXIT_SUCCESS   0

section .data
    msg db "Hello, World!", 0xA, 0
    len equ $ - msg
    
section .text
    global _start
    
_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, len
    syscall
    
    ; Clean exit
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
