NAME		= s21_cat
HEADERS		= $(wildcard *.h)
OBJ			= $(patsubst %.c,%.o,$(wildcard *.c))
CC			= gcc
CFLAGS		= -Wall -Werror -Wextra

all:		$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) $^ -o $@
	rm -f $(OBJ)

$(OBJ):		$(HEADERS)

clean:
	rm -f $(OBJ)

fclean:		clean
	rm -f $(NAME)

re:			fclean all

.PHONY:		all, clean, fclean, re
.SECONDARY:	$(OBJ) 
