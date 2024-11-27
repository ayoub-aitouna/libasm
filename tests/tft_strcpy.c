#include "includes/ft_strcpy.h"

void tft_strcpy(char *src)
{

    char dst[100];
    char ft_dst[100];

    ft_strcpy(ft_dst, src);
    strcpy(dst, src);

    if (strcmp(dst, ft_dst) == 0)
        printf("-> OK\n");
    else
        printf("-> Failed, reason: \ndst : --%s--\nft_dst: --%s-- \n", ft_dst, dst);
}