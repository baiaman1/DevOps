CC= gcc -std=c11 -D_GNU_SOURCE
CFLAGS= -Wall -Wextra -Werror
CAT= s21_cat.c

all: s21_cat

s21_cat:
	$(CC) $(CFLAGS) $(CAT) -o s21_cat

test:
	bash testCat.sh

clear:
	rm -rf s21_cat
	rm -rf *.a *.out *.o *.txt

style:
	clang-format -Werror -n s21_cat.c
 



rebuild:
	make clear
	make all
	rm -rf  *.o *.a
