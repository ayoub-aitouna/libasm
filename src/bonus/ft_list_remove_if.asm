section .text
    global ft_list_remove_if
    extern write


ft_list_remove_if:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 48
    mov     [rbp-24], rdi
    mov     [rbp-32], rsi
    mov     [rbp-40], rdx
    mov     dword [rbp-4], 0
    jmp     .L2
.L3:
        mov     rdx, [rbp-40]
        mov     esi, 45
        mov     edi, 12
        mov     eax, 0
        call    rdx
        add     dword [rbp-4], 1
.L2:
        cmp     dword [rbp-4], 9
        jle     .L3
        nop
        nop
        leave
        ret

;function void ft_list_remove_if(int (*cmp)())
;params t_list **begin_list -> rdi, void *data_ref -> rsi, int (*cmp)() -> rdx
ft_list_remov__e_if:
    ; push rbp
    sub rsp, 56
    xor rax, rax
    mov r9, 0x0
    mov [rsp - 16], r9; i = 0
    mov [rsp - 24], rdx

    .LS:
        mov rdi, [rsp - 16]
        cmp rdi, 0x10 ; if(i == 16)
        jz .FE

        inc rdi
        mov [rsp - 16], rdi; i++
        mov byte [rsp], '2'
        mov rdi, 0x1
        mov rsi, rsp
        mov rdx, 0x1
        call [rsp - 24]
        xor rax, rax
        call write wrt ..plt
        jmp .LS
        
    .FE:
        mov rax, [rsp - 16]
        add rsp, 56
    
        ret


