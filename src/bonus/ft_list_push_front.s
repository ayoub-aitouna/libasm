section .text
    global ft_list_push_front

;params t_list **lst  -> rdi , t_list *new -> rsi
ft_list_push_front:
    mov [rsi + 8], rdi
    mov [rdi], rsi
    ret