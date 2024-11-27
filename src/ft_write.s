section .text
    extern ft_write

;params fd -> rdi, str -> rsi, len -> rdx
ft_write:
    mov rax, 0x01
    syscall
    ret