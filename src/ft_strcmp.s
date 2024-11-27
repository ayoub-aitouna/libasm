section .text
    global ft_strcmp

; params, s1 -> rdi, s2 -> rsi
ft_strcmp:
    xor rax, rax
    xor rbx, rbx
    start_loop:

        mov al, [rdi]
        mov bl, [rsi]
        
        cmp al, bl
        jne end_loop ; if(s1[i] != s2[i])

        cmp al, 0x0
        je end_loop ; if(s1[i] == 0)

        cmp bl, 0x0
        je end_loop ; if(s2[i] == 0)
        
        inc rdi
        inc rsi
        jmp start_loop

    end_loop:
        sub rax, rbx
        ret
