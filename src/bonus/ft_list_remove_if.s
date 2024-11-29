section .text
    global ft_list_remove_if
    extern write


ft_list_remove_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD [rbp-40], rdi
        mov     QWORD [rbp-48], rsi
        mov     QWORD [rbp-56], rdx
        lea     rax, [rbp-32]
        mov     QWORD [rbp-8], rax
        mov     rax, QWORD [rbp-40]
        mov     rax, QWORD [rax]
        mov     QWORD [rbp-16], rax
        mov     rax, QWORD [rbp-40]
        mov     rax, QWORD [rax]
        mov     QWORD [rbp-24], rax
        jmp     .L2
.L4:
        mov     rax, QWORD [rbp-16]
        mov     rax, QWORD [rax]
        mov     rdx, QWORD [rbp-48]
        mov     rcx, QWORD [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 0
        call    rcx
        test    eax, eax
        jne     .L3
        mov     rax, QWORD [rbp-16]
        mov     rdx, QWORD [rax+8]
        mov     rax, QWORD [rbp-8]
        mov     QWORD [rax+8], rdx
        mov     rax, QWORD [rbp-8]
        mov     rax, QWORD [rax+8]
        mov     QWORD [rbp-16], rax
        jmp     .L2
.L3:
        mov     rax, QWORD [rbp-16]
        mov     QWORD [rbp-8], rax
        mov     rax, QWORD [rbp-16]
        mov     rax, QWORD [rax+8]
        mov     QWORD [rbp-16], rax
.L2:
        cmp     QWORD [rbp-16], 0
        jne     .L4
        mov     rdx, QWORD [rbp-24]
        mov     rax, QWORD [rbp-40]
        mov     QWORD [rax], rdx
        nop
        leave
        ret



; ft_list_remove_if:
;     push        rbp
;     mov         rbp, rsp
;     sub         rsp, 96
;     mov QWORD   [rbp-24], rdi
;     mov         [rbp-32], rsi
;     mov         [rbp-40], rdx
;     lea         rax, [rbp-80]
;     mov QWORD   [rbp-48], rax
    
;     mov         rax, [rbp-24]
;     mov         rax, [rax]
;     mov         [rbp-56], rax

;     mov         [rbp-72], rax

;     jmp         .L2

; .L3:
;     mov         rdx, [rbp-40]
;     mov         rax, [rbp-56]
;     mov         rdi, [rax]
;     mov         rsi, [rbp-32]
    
;     xor         rax, rax
;     call        rdx
;     test        rax, rax
;     jz          .L4 
;     jmp         .L6

; .L2:
;     cmp         dword   [rbp-56], 0
;     jne         .L3

;     mov         rax,  QWORD [rbp-80]
;     mov         rax,  [rax + 8]

;     mov         rbx,  QWORD [rbp-24]
;     mov         [rbx], rax
    
;     xor         rax, rax
;     leave
;     ret
    
; .L4:
;     mov         rax, qword [rbp-56]
;     mov         rax, qword [rax+8]

;     mov         rbx, qword [rbp-48]
;     mov         qword [rbx+8], rax
;     mov         rbx,  [rbx+8]
;     mov         qword [rbp-56], rbx

;     jmp .L2

; .L6:
;     mov         rax, qword [rbp-56]
;     mov         qword [rbp-48],   rax

;     mov         rax, qword [rbp-56]
;     mov         rax, qword [rax+8]
;     mov         qword [rbp-56], rax

;     jmp .L2