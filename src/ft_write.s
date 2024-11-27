
section .text
    global ft_write
    extern __errno_location


;params fd -> rdi, str -> rsi, len -> rdx
ft_write:
    mov rax, 0x01
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