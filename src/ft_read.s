section .text
    global ft_read
    extern __errno_location
;params fd -> rdi, str -> rsi, len -> rdx
ft_read:
    mov rax, 0x00
    syscall
    cmp rax, 0x0
    jl .EH
    ret
.EH:
    neg rax
    mov rdi, rax
    call __errno_location wrt ..plt 
    mov [rax], rdi
    mov rax, -1
    ret