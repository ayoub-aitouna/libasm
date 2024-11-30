section .text
    global ft_read
    extern __errno_location
ft_read:
    push    rbp
    mov     rbp, rsp
    mov     rax, 0x00
    syscall
    cmp     rax, 0x0
    jg      .L1

    neg     rax
    mov     rdi, rax
    call    __errno_location wrt ..plt 
    mov     [rax], rdi
    mov     rax, -1
.L1:

    leave
    ret