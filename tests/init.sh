nasm -f elf64 -o ft_strcmp.o src/ft_strcmp.asm
gcc -c testers/test_strcmp.c -o test_strcmp.o
gcc -o test_strcmp test_strcmp.o ft_strcmp.o
./test_strcmp