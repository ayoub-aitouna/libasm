section .text
    global ft_list_size

;params fd -> rdi, str -> rsi, len -> rdx
ft_list_size:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32
    
    mov     qword [rsp-8], rdi
    mov     dword [rsp-16], 0 ; count

    mov     rax, qword [rsp-8] 
    test    rax, rax
    jz      .L4

    jmp .L2

.L3:
    mov     rax, [rsp-8]
    mov     rax, [rax+8]
    mov     [rsp-8], rax

    add     qword [rsp-16], 1
    
.L2:
    mov     rax, qword [rsp-8] 
    test    rax, rax
    jnz     .L3

.L4:
    xor     rax, rax
    mov     rax, [rsp-16]
    leave
    ret