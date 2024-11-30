#include "includes/ft_t_list.h"
#include <errno.h>
#include <unistd.h>

t_list *lst_new(void *data)
{
    t_list *lst;

    lst = (t_list *)malloc(sizeof(t_list));
    lst->next = 0;
    lst->data = data;
    return (lst);
}

int cmp(void *a, void *b)
{
    return (a == b) ? 0 : 1;
}

int scmp(void *a, void *b)
{
    return   a - b;
}

void ft_printlist(t_list *lst)
{
    printf("\n--------------------\n");
    while (lst)
    {
        printf("data : %p \n", lst->data);
        lst = lst->next;
    }
    printf("--------------------\n\n");
}
