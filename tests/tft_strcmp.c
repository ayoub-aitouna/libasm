#include "includes/ft_strcmp.h"

void tft_strcmp(char *s1, char *s2)
{

    int ft_result, result;

    ft_result = ft_strcmp(s1, s2);
    result = strcmp(s1, s2);

    if (result != ft_result)
        printf("-x Failed: %s, %s ", s1, s2);
    else
        printf("-> OK");
    printf("\n");
}

