SRC		:= $(wildcard src/*.s) $(wildcard src/bonus/*.s)
OBJ_DIR	:= .compiled
OBJ		:= $(patsubst %.s, $(OBJ_DIR)/%.o, $(SRC))


TFT_SRC		:= $(wildcard tests/*.c)
TFT_OBJ		:= $(patsubst %.c, $(OBJ_DIR)/%.o, $(TFT_SRC))

NAME	:=  libasm.a
TFT_NAME	:= tester
AR	:= ar crs


$(OBJ_DIR)/%.o : %.s
	@mkdir -p $(dir $@)
	@nasm -f elf64 $< -o $@


$(OBJ_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	@gcc -c $< -o $@

$(NAME) : $(OBJ)
	@$(AR) $(NAME) $(OBJ)

check:fclean $(TFT_OBJ) $(NAME)
	@gcc -o $(TFT_NAME) $(TFT_OBJ) $(NAME)
	./$(TFT_NAME)

debug: fclean $(TFT_OBJ) $(NAME)
	@gcc -o $(TFT_NAME) $(TFT_OBJ) $(NAME)
	@gdb -ex "set disassembly-flavor intel" \
		-ex "lay next"\
	    -ex "break ft_list_remove_if.L2" \
	    -ex "run"\
	    ./$(TFT_NAME)

clean :
	rm $(OBJ)

fclean :
	rm -rf $(OBJ_DIR) $(NAME) $(TFT_NAME)

re : fclean $(NAME)