section .text
    global ft_strcmp

; params, s1 -> rdi, s2 -> rsi
ft_strcmp:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax
    xor     rbx, rbx
.L2:

    mov     al, [rdi]
    mov     bl, [rsi]
    
    cmp     al, bl
    jne     .L1 ; if(s1[i] != s2[i])

    cmp     al, 0x0
    je      .L1 ; if(s1[i] == 0)

    cmp     bl, 0x0
    je      .L1 ; if(s2[i] == 0)
    
    inc     rdi
    inc     rsi
    jmp     .L2

.L1:
        sub rax, rbx
        leave
        ret
