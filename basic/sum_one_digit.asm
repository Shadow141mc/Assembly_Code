; Program to add two single digit numbers

section .data
    prompt1 db "Enter first number: "
    len1 equ $ - prompt1
    prompt2 db "Enter second number: "
    len2 equ $ - prompt2

    msg db "The sum is: "
    len3 equ $ - msg 

    SYS_WRITE equ 1
    STDOUT equ 1
    SYS_READ equ 0
    STDIN equ 0
    EXIT equ 60
    EXIT_SAFE equ 0

section .bss 
    num1 resb 2
    num2 resb 2
    sum resb 2

section .text
    global _start

_start:
    ; Provide first prompt to user
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, prompt1 
    mov rdx, len1 
    syscall

    ; take first number as input
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, num1
    mov rdx, 2
    syscall

    ; Provide second prompt to user
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, prompt2
    mov rdx, len2
    syscall

    ; take second number as input
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, num2
    mov rdx, 2
    syscall

    ; find the sum and store it in <sum>
    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    add al, bl
    add al, '0'
    mov [rel sum], al

    ; Answer line
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, len3
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    lea rsi, [rel sum]
    mov rdx, 1
    syscall

    ; exit the program
    mov rax, EXIT
    mov rdi, EXIT_SAFE
    syscall