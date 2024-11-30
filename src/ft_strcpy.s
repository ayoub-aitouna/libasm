section .text
    global ft_strcpy

; params, dest -> rdi, src -> rsi
ft_strcpy:
    push    rbp
    mov     rbp, rsp
    lea     rax, [rdi]
.L1:
    mov     bl, [rsi]
    cmp     bl, 0x0
    je      .L2
    mov     [rdi], bl
    inc     rdi
    inc     rsi
    jmp     .L1
.L2:
    mov bl, 0x0
    mov [rdi], bl
    
    leave
    ret