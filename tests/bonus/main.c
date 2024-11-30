
#include "../includes/ft_t_list.h"
#include "../includes/main.h"
#include <stdlib.h>

int main()
{

    t_list *lst;
    lst = lst_new((void *)5);
    ft_list_push_front(&lst, lst_new((void *)51));
    ft_list_push_front(&lst, lst_new((void *)15));
    ft_list_push_front(&lst, lst_new((void *)2545));
    ft_list_push_front(&lst, lst_new((void *)155));
    ft_list_push_front(&lst, lst_new((void *)205));
    ft_list_push_front(&lst, lst_new((void *)25));
    ft_list_push_front(&lst, lst_new((void *)125));

    printf("testing ft_list_remove_if \n");
    ft_printlist(lst);
    ft_list_remove_if(&lst, (void *)5, &cmp);
    ft_printlist(lst);



    printf("testing ft_list_sort \n");
    ft_printlist(lst);
    ft_list_sort(&lst, &scmp);
    ft_printlist(lst);

    printf("tetsing ft_list_size => %d \n", ft_list_size(lst));

    return 0;
}
