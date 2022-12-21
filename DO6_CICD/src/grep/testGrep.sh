#!/bin/bash

blue=$'\033[0;34m'
red=$'\033[0;31m'
reset=$'\033[0;39m'


# 10
    ./s21_grep e s21_grep.c Makefile > s21_10.txt  # 10 
    grep e s21_grep.c Makefile > 10.txt
    diff -s s21_10.txt 10.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_10() ${blue}passed${reset}"
    else 
        echo "test_10() ${red}failure${reset}"
    fi
    rm s21_10.txt 10.txt


# 11 i
    ./s21_grep -i e s21_grep.c > s21_11.txt  
    grep -i e s21_grep.c > 11.txt
    diff -s s21_11.txt 11.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_11(i) ${blue}passed${reset}"
    else 
        echo "test_11(i) ${red}failure${reset}"
    fi
    rm s21_11.txt 11.txt


# 12 v
    ./s21_grep -v e s21_grep.c > s21_12.txt  
    grep -v e s21_grep.c > 12.txt
    diff -s s21_12.txt 12.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_12(v) ${blue}passed${reset}"
    else 
        echo "test_12(v) ${red}failure${reset}"
    fi
    rm s21_12.txt 12.txt


# 13 c
    ./s21_grep -c e s21_grep.c > s21_13.txt  
    grep -c e s21_grep.c > 13.txt
    diff -s s21_13.txt 13.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_13(c) ${blue}passed${reset}"
    else 
        echo "test_13(c) ${red}failure${reset}"
    fi
    rm s21_13.txt 13.txt


# 14 l
    ./s21_grep -l e s21_grep.c s21_grep.h Makefile  > s21_14.txt  
    grep -l e s21_grep.c s21_grep.h Makefile  > 14.txt
    diff -s s21_14.txt 14.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_14(l) ${blue}passed${reset}"
    else 
        echo "test_14(l) ${red}failure${reset}"
    fi
    rm s21_14.txt 14.txt


# 15 n
    ./s21_grep -n e s21_grep.h  > s21_15.txt  
    grep -n e s21_grep.h  > 15.txt
    diff -s s21_15.txt 15.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_15(n) ${blue}passed${reset}"
    else 
        echo "test_15(n) ${red}failure${reset}"
    fi
    rm s21_15.txt 15.txt


# 16 o
    ./s21_grep -o grep s21_grep.c  > s21_16.txt  
    grep -o grep s21_grep.c  > 16.txt
    diff -s s21_16.txt 16.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_16(o) ${blue}passed${reset}"
    else 
        echo "test_16(o) ${red}failure${reset}"
    fi
    rm s21_16.txt 16.txt


 # 17 h
    ./s21_grep -h grep s21_grep.c Makefile > s21_17.txt 
    grep -h grep s21_grep.c Makefile > 17.txt
    diff -s s21_17.txt 17.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_17(h) ${blue}passed${reset}"
    else 
        echo "test_17(h) ${red}failure${reset}"
    fi
    rm s21_17.txt 17.txt


# 18 s
    ./s21_grep grep -s 123123 > s21_18.txt  
    grep grep -s 123123 > 18.txt
    diff -s s21_18.txt 18.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_18(s) ${blue}passed${reset}"
    else 
        echo "test_18(s) ${red}failure${reset}"
    fi
    rm s21_18.txt 18.txt


# 19 f
    ./s21_grep -f pattern s21_grep.c > s21_19.txt  
    grep -f pattern s21_grep.c > 19.txt
    diff -s s21_19.txt 19.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_19(f) ${blue}passed${reset}"
    else 
        echo "test_19(f) ${red}failure${reset}"
    fi
    rm s21_19.txt 19.txt


# 20 in
    ./s21_grep -in grep s21_grep.c > s21_20.txt  
    grep -in grep s21_grep.c > 20.txt
    diff -s s21_20.txt 20.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_20(in) ${blue}passed${reset}"
    else 
        echo "test_20(in) ${red}failure${reset}"
    fi
    rm s21_20.txt 20.txt


# 21 cv
    ./s21_grep -cv e s21_grep.c > s21_21.txt  
    grep -cv e s21_grep.c > 21.txt
    diff -s s21_21.txt 21.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_21(cv) ${blue}passed${reset}"
    else 
        echo "test_21(cv) ${red}failure${reset}"
    fi
    rm s21_21.txt 21.txt


# 22 iv
    ./s21_grep -iv e s21_grep.c > s21_22.txt  
    grep -iv e s21_grep.c > 22.txt
    diff -s s21_22.txt 22.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_22(iv) ${blue}passed${reset}"
    else 
        echo "test_22(iv) ${red}failure${reset}"
    fi
    rm s21_22.txt 22.txt


# 23 lv
    ./s21_grep -lv e s21_grep.c Makefile s21_grep.h > s21_23.txt  
    grep -lv e s21_grep.c Makefile s21_grep.h > 23.txt
    diff -s s21_23.txt 23.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_23(lv) ${blue}passed${reset}"
    else 
        echo "test_23(lv) ${red}failure${reset}"
    fi
    rm s21_23.txt 23.txt


# 24 ho
    ./s21_grep -ho s21 s21_grep.c s21_grep.h > s21_24.txt  
    grep -ho s21 s21_grep.c s21_grep.h > 24.txt
    diff -s s21_24.txt 24.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_24(ho) ${blue}passed${reset}"
    else 
        echo "test_24(ho) ${red}failure${reset}"
    fi
    rm s21_24.txt 24.txt


# 25 nf
    ./s21_grep -nf pattern s21_grep.c > s21_25.txt  
    grep -nf pattern s21_grep.c > 25.txt
    diff -s s21_25.txt 25.txt &>/dev/null
    if [[ $? -eq 0 ]] ; then 
        echo "test_25(nf) ${blue}passed${reset}"
    else 
        echo "test_25(nf) ${red}failure${reset}"
    fi
    rm s21_25.txt 25.txt
