#include "includes/ft_strcmp.h"
#include "includes/ft_strlen.h"
#include "includes/ft_strcpy.h"
#include "includes/ft_write.h"

int ft_write(int fd, char *str, int len);

int main()
{

    printf("\n > TESTING FT_STRCMP ...... \n");

    tft_strcmp("testing00", "testng00");
    tft_strcmp("testing00", "testing00");
    tft_strcmp("testing00", "testing01");
    tft_strcmp("testing00", "testing0");
    tft_strcmp("testing00", "testing000");
    tft_strcmp("testing00", "testing0000");
    tft_strcmp("You Are D", "We Are ");
    tft_strcmp("You Are D", "You Are ");
    tft_strcmp("", "You Are D");
    tft_strcmp("000000000000", "");
    tft_strcmp("", "");
    tft_strcmp("000000000000", "000000000000");
    tft_strcmp("000000000000", "000000000001");
    tft_strcmp("", "000000000001");

    printf("\n > TESTING FT_STRLEN ...... \n");

    tft_strlen("testing00");
    tft_strlen("testing00");
    tft_strlen("testing0-testing01");
    tft_strlen("testing00............testing0");
    tft_strlen("testing0                       testing000");
    tft_strlen("testing00\t\t\ttesting0000");
    tft_strlen("You Are D  Are ");
    tft_strlen("You Are DYou Are ");
    tft_strlen("");
    tft_strlen("000000000000\n\n\n");
    tft_strlen("");
    tft_strlen("000000000000000000000000");
    tft_strlen("000000000000                                                               000000000001");
    tft_strlen("\t\n                 000000000001");

    printf("\n > TESTING FT_STRCPY ...... \n");

    tft_strcpy("testing00");
    tft_strcpy("testing00");
    tft_strcpy("testing0-testing01");
    tft_strcpy("testing00............testing0");
    tft_strcpy("testing0                       testing000");
    tft_strcpy("testing00\t\t\ttesting0000");
    tft_strcpy("You Are D  Are ");
    tft_strcpy("You Are DYou Are ");
    tft_strcpy("");
    tft_strcpy("000000000000\n\n\n");
    tft_strcpy("");
    tft_strcpy("000000000000000000000000");
    tft_strcpy("000000000000                                                               000000000001");
    tft_strcpy("\t\n                 000000000001");

    printf("\n > TESTING FT_WRITE ............. \n");
    tft_write(1, "Hello, World !\n", 15);
    tft_write(1, "Salut, le monde !\n", 18);
    tft_write(1, "Hola, Mundo !\n", 14);
    tft_write(1, "Hallo, Welt !\n", 14);
    tft_write(-2, "Ciao, Mondo !\n", 14);
    tft_write(600, "Olá, Mundo !\n", 14);

    return 0;
}