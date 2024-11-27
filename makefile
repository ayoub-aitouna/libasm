SRC		:= $(wildcard src/*.s)
OBJ_DIR	:= .compiled
OBJ		:= $(patsubst %.s, $(OBJ_DIR)/%.o, $(SRC))


TFT_SRC		:= $(wildcard tests/*.c)
TFT_OBJ		:= $(patsubst %.c, $(OBJ_DIR)/%.o, $(TFT_SRC))

NAME	:= program
TFT_NAME	:= tester


$(OBJ_DIR)/%.o : %.s
	@mkdir -p $(dir $@)
	@nasm -f elf64 $< -o $@


$(OBJ_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	@gcc -c $< -o $@

$(NAME) : $(OBJ)
	@ld $(OBJ) -o $(NAME)

check: $(TFT_OBJ) $(OBJ)
	@gcc -o $(TFT_NAME) $(TFT_OBJ) $(OBJ)
	./$(TFT_NAME)
clean :
	rm $(OBJ)

fclean :
	rm -rf $(OBJ_DIR) $(NAME)

re : fclean $(NAME)