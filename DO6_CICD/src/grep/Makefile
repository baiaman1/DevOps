CC= gcc -std=c11 -D_GNU_SOURCE
CFLAGS= -Wall -Wextra -Werror
GREP= s21_grep.c

all: s21_grep

s21_grep:
	$(CC) $(CFLAGS) $(GREP) -o s21_grep

test:
	bash testGrep.sh

clear:
	rm -rf s21_grep
	rm -rf *.a *.out *.o *.txt

style:
	clang-format -n s21_grep.c

rebuild:
	make clear
	make all
	rm -rf  *.o *.a