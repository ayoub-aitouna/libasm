#include "includes/ft_strlen.h"

void tft_strlen(char *s1)
{
    int ft_len, len;

    ft_len = ft_strlen(s1);
    len = strlen(s1);

    if (len != ft_len)
        printf("-x Failed: <%s> ", s1);
    else
        printf("-> OK");
    printf("\n");
}
