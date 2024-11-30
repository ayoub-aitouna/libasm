section .text
    global ft_list_sort

;params fd -> rdi, str -> rsi, len -> rdx
ft_list_sort:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 64

    mov     qword [rbp-8], rdi ; stor begin_list 
    mov     qword [rbp-16], rsi ; stor cmp PTR
    
    test    rdi, rdi
    jz      .L7

    mov     rax, qword [rbp-8]
    mov     rax, [rax]
    mov     qword [rbp-24], rax ; current = *begin_list

    jmp .L2

.L3:
    mov     rax, qword [rbp-8]
    mov     rax, [rax]
    mov     qword [rbp-32], rax ; tmp = *begin_list
    jmp     .L4

.L5:
    mov     rax, qword [rbp-32]
    mov     rdi, qword [rax] ; p1 = tmp->data

    mov     rax, qword [rbp-32]
    mov     rax, qword [rax+8]
    mov     rsi, [rax] ; p2 = tmp->next->data

    mov     rcx,  qword [rbp-16]
    xor     rax, rax
    call    rcx ; cmp(p1, p2)
    cmp     rax, 0
    
    jle      .L6
    
    mov     rax, qword [rbp-32]
    mov     rax, [rax]
    mov     qword [rbp-40], rax ; next = temp->data
    
    mov     rax, qword [rbp-32] 
    mov     rax, qword [rax+8]
    mov     rax, [rax]
    
    mov     rcx, qword [rbp-32] 
    mov     [rcx], rax

    mov     rax, qword [rbp-32]
    mov     rax, qword [rax+8]
    mov     rcx, qword [rbp-40]
    mov     [rax], rcx
    
.L6:
    mov     rax, qword [rbp-32]
    mov     rax, qword [rax+8]
    mov     qword [rbp-32], rax ;temp = temp->next;

.L4:
    mov     rax, qword [rbp-32]
    mov     rax, [rax+8]
    test    rax, rax ; if(tmp->next != 0) goto L5
    jnz     .L5
    mov     rax, qword [rbp-24]
    mov     rax, qword [rax+8]
    mov     qword [rbp-24], rax
 
.L2:
    mov     rax, qword [rbp-24]
    test    rax, rax ; if(current != 0) goto L3
    jnz     .L3

.L7:
    leave
    ret