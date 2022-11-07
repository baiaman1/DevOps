#!/bin/bash

# Написать bash-скрипт. Скрипт запускается с одним параметром. Параметр текстовый.
# Скрипт выводит значение параметра.
# Если параметр - число, то должно выводится сообщение о некорректности ввода.
if [[ $# = 0 ]]; then
    echo "Empty parametr"
elif [[ $# > 1 ]]; then
    echo "Too many parametrs"
elif [[ $1 =~ [0-9] ]]; then
    echo "Incorrect input"
else
    echo $1
fi