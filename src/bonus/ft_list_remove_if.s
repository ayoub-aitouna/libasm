section .text
    global ft_list_remove_if
    extern write


;function void ft_list_remove_if(int (*cmp)())
;params t_list **begin_list -> rdi, void *data_ref -> rsi, int (*cmp)() -> rdx
ft_list_remove_if:
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


; section .text
;     global ft_list_remove_if

; ;function void ft_list_remove_if(int (*cmp)())
; ;params t_list **begin_list -> rdi, void *data_ref -> rsi, int (*cmp)() -> rdx
; ft_list_remove_if:
;     sub rsp, 56
    
;     xor r11, r11 
;     mov [rsp - 16], r11
;     mov [rsp - 24], rdi
;     mov [rsp - 32], rsi
;     mov [rsp - 40], rdx 
;     xor rax, rax
;     mov [rsp - 48], rax
    
    
;     test rdi, rdi
;     jz .FE


;     mov rdi, [rsp - 24]
;     mov r9, [rdi] 
;     test r9, r9
;     jz .FE



;     mov rdi, [rsp - 24]
;     mov rdi, [rdi]
;     mov [rsp - 16], rdi


;     .LS:
;         mov rdi, [rsp - 16]
;         test rdi, rdi ; if(current == NULL)
;         jz .FE
        
;         mov rdi, [rdi]
;         mov rsi, [rsp - 32]
;         call [rsp - 40]
;         test rax, rax; if(cmp(current->data, data_ref) == 0)
;         jnz .INC

;         mov r10, [rsp - 48]
;         test r10, r10
;         jz .PZ

;         jmp .INC
;         .PZ:
;             mov rdi, [rsp - 16];|\ 
;             mov rdi, [rdi + 8]; |  > *begin_list = current->next
;             mov [rsp - 24], rdi;|/
;             jmp .INC
        
;         .INC:
;             mov r11, [rsp - 16];|\
;             mov [rsp - 48], r11;|  > previous = current

;             mov rdi, [rsp - 16];|\ 
;             mov rdi, [rdi + 8]; |  > current = current->next
;             mov [rsp - 16], rdi;|/

;             xor rax, rax
;         jmp .LS
        
;     .FE:
;         xor rax, rax
;         add rsp, 56
;         ret

        