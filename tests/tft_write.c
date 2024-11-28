#include "includes/ft_write.h"
#include <errno.h>
#include <unistd.h>

void tft_write(int fd, char *s1, int len)
{
    int ft_r, r;
    int ft_er, er;

    ft_r = ft_write(fd, s1, len);
    ft_er = errno;
    r = write(fd, s1, len);
    er = errno;

    if (r != ft_r || ft_er != er)
        printf("-x Failed: return values [%d, %d], errno values [%d, %d]", ft_r, r, ft_er, er);
    else
        printf("-> OK");
    printf("\n");
}
