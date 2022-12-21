#!/bin/bash

blue=$'\033[0;34m'
red=$'\033[0;31m'
reset=$'\033[0;39m'

./s21_cat s21_cat.c >> s21_cat.txt
cat s21_cat.c >> cat.txt
diff -s s21_cat.txt cat.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_1() ${blue}passed${reset}"
else 
    echo "test_1() ${red}failure${reset}"
    exit 1
fi
rm s21_cat.txt cat.txt

./s21_cat -b s21_cat.c >> s21_flagB.txt
cat -b s21_cat.c >> flagB.txt
diff -s s21_flagB.txt flagB.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_2(b) ${blue}passed${reset}"
else 
    echo "test_2(b) ${red}failure${reset}"
    exit 1
fi
rm s21_flagB.txt flagB.txt

./s21_cat -e s21_cat.c >> s21_flagE.txt
cat -e s21_cat.c >> flagE.txt
diff -s s21_flagE.txt flagE.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_3(e) ${blue}passed${reset}"
else 
    echo "test_3(e) ${red}failure${reset}"
    exit 1
fi
rm s21_flagE.txt flagE.txt

./s21_cat -n s21_cat.c >> s21_flagN.txt
cat -n s21_cat.c >> flagN.txt
diff -s s21_flagN.txt flagN.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_4(n) ${blue}passed${reset}"
else 
    echo "test_4(n) ${red}failure${reset}"
    exit 1
fi
rm s21_flagN.txt flagN.txt

./s21_cat -s Makefile >> s21_flagS.txt 
cat -s Makefile >> flagS.txt
diff s21_flagS.txt flagS.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_5(s) ${blue}passed${reset}"
else 
    echo "test_5(s) ${red}failure${reset}"
    exit 1
fi
rm s21_flagS.txt flagS.txt

./s21_cat -t s21_cat.c >> s21_flagT.txt
cat -t s21_cat.c >> flagT.txt
diff -s s21_flagT.txt flagT.txt &>/dev/null
if [[ $? -eq 0 ]] ; then 
    echo "test_6(t) ${blue}passed${reset}"
else 
    echo "test_6(t) ${red}failure${reset}"
    exit 1
fi
rm s21_flagT.txt flagT.txt
