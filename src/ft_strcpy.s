section .text
    global ft_strcpy

; params, dest -> rdi, src -> rsi
ft_strcpy:
    lea rax, [rdi]
    LS:
        mov bl, [rsi]
        cmp bl, 0x0
        je LE
        mov [rdi], bl
        inc rdi
        inc rsi
        jmp LS
    LE:
        mov bl, 0x0
        mov [rdi], bl
        ret