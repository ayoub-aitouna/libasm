section .text
    global ft_list_push_front

ft_list_push_front:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    mov     qword [rbp-8], rdi
    mov     qword [rbp-16], rsi

    test    rdi, rdi
    jz      .L2

    mov     rdi, qword [rbp-8]
    mov     rsi, qword [rbp-16]

    mov     rax, rdi
    mov     rax, [rax]

    mov     [rsi + 8], rax
    mov     [rdi], rsi

.L2:
    leave
    ret