section .text
    extern ft_read

;params fd -> rdi, str -> rsi, len -> rdx
ft_read:
    mov rax, 0x00
    syscall
    ret