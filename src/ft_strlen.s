section .text
    global ft_strlen


; params, str -> rdi
; return, rax
ft_strlen:
    xor rax, rax

    while_loop:        
        lea rcx, [rdi]; rcx = str
        mov bl, [rcx]; bl = str[i]
        cmp bl, 0x0 ; if (_str[i] == 0)
        je end_loop ; break
        inc rax; i++
        inc rdi; str++
        jmp while_loop; continue
        
    end_loop:
        ret
