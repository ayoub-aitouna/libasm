
#ifndef FT_TLIST
#define FT_TLIST
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_list
{
    void *data;
    struct s_list *next;
} t_list;

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
void ft_list_sort(t_list **begin_list, int (*cmp)());
int ft_list_size(t_list *begin_list);
void ft_list_push_front(t_list **begin_list, t_list *new);

// Test Utils
void ft_printlist(t_list *lst);
t_list *lst_new(void *data);
int cmp(void *a, void *b);
int scmp(void *a, void *b);
#endif