SRC		:= $(wildcard src/*.s)

BSRC	:= $(wildcard src/*.s) $(wildcard src/bonus/*.s)

OBJ_DIR	:= .compiled

OBJ		:= $(patsubst %.s, $(OBJ_DIR)/%.o, $(SRC))
BONUSOBJECT		:= $(patsubst %.s, $(OBJ_DIR)/%.o, $(BSRC))


MTESTS_SRC		:= $(wildcard tests/*.c) $(wildcard tests/mendatory/*.c)
MTESTS_OBJ		:= $(patsubst %.c, $(OBJ_DIR)/%.o, $(MTESTS_SRC))


BTESTS_SRC		:= $(wildcard tests/*.c) $(wildcard tests/bonus/*.c)
BTESTS_OBJ		:= $(patsubst %.c, $(OBJ_DIR)/%.o, $(BTESTS_SRC))



NAME	:=  libasm.a
BNAME	:=  libbonus.a
MTEST_NAME	:= tester
BTEST_NAME	:= bonus_tester
AR	:= ar crs


$(OBJ_DIR)/%.o : %.s
	@mkdir -p $(dir $@)
	@nasm -f elf64 $< -o $@


$(OBJ_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	@gcc -c $< -o $@


$(NAME) : $(OBJ)
	@$(AR) $(NAME) $(OBJ)

$(BNAME) : $(BONUSOBJECT)
	@$(AR) $(BNAME) $(BONUSOBJECT)


bonus: $(BNAME) 

check: $(MTESTS_OBJ) $(NAME)
	@gcc -o $(MTEST_NAME) $(MTESTS_OBJ) -L. -lasm
	@./$(MTEST_NAME)

check_bonus: $(BTESTS_OBJ) $(BNAME)
	@gcc -o $(MTEST_NAME) $(BTESTS_OBJ) -L. -lbonus
	@./$(MTEST_NAME)

clean :
	rm -rf $(OBJ_DIR)

fclean :
	rm -rf $(OBJ_DIR) $(NAME) $(BNAME) $(MTEST_NAME)

re : fclean $(NAME)