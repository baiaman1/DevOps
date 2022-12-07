#!/bin/bash

. ./functions5.sh
timedatectl set-timezone Europe/Moscow

function main {
    if [ $# -gt 1 ] ; then 
        echo "too many parameters!"
    elif [ -z $1 ] ; then
        echo "empty parameter"
    else
        case "$1" in
        1) way1;;
        2) way2;;
        3) way3;;
        4) way4;;
        *) 
        echo -e "wrong enter! \nenter 1-4";;
        esac
    fi
}
main $@