section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

; params str -> rdi
ft_strdup:
    push rdi
    call ft_strlen ; ft_strlen(rdi)
    
    mov rdi, rax ; rdi = ft_strlen(rdi)
    call malloc wrt ..plt ; malloc(ft_strlen(rdi))
    
    test rax, rax ; if (malloc(ft_strlen(rdi)) == NULL)
    jz .EH ; goto .EH
    
    pop rdi ; rdi = str
    
    push rax
    mov rsi, rdi
    mov rdi, rax
    call ft_strcpy ; ft_strcpy(rax, rdi)
    pop rax
    
    ret ; return

.EH:
    mov rax, 0
    ret