section .text
    global ft_list_remove_if
    extern write


ft_list_remove_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64

        mov     qword [rbp-40], rdi
        mov     [rbp-48], rsi
        mov     qword [rbp-56], rdx
        
        lea     rax, [rbp-32]
        mov     qword [rbp-8], rax

        mov     rax, qword [rbp-40]
        mov     rax, [rax]
        mov     qword [rbp-16], rax

        mov     rax, qword [rbp-40]
        mov     rax, [rax]
        mov     qword [rbp-24], rax
        
        jmp .L2
.L4:
        mov     rax, qword [rbp-16]
        mov     rax, [rax]

        mov     rdx, [rbp-48]
        mov     rcx, qword [rbp-56]
        
        mov     rdi, rax
        mov     rsi, rdx

        xor     eax, eax
        call    rcx
        test    eax, eax
        
        jne      .L3
        
        mov     rax, qword [rbp-16]
        mov     rdx, qword [rax+8]
        mov     rax, qword [rbp-8]
        mov     qword [rax+8], rdx

        mov     rax, qword [rbp-8]
        mov     rax, qword [rax+8]
        mov     qword [rbp-16], rax
        jmp     .L2
.L3:

        mov     rax, qword [rbp-16]
        mov     qword [rbp-8], rax
        
        mov     rax, qword [rbp-16] 
        mov     rax, qword [rax+8] 
        mov     qword [rbp-16], rax

.L2:
        cmp qword [rbp-16], 0
        jne .L4

        mov     rdx, qword [rbp-24]
        mov     rax, qword [rbp-40]
        mov     qword [rax], rdx
        
        nop
        leave
        ret