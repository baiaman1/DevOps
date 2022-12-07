#!/bin/bash

. ./functions3.sh

function main {
    if [ $# -gt 1 ] ; then 
        echo "too many parameters"
    elif [ -z $1 ] ; then
        echo -e "empty parameter \nenter 1, 2 or 3"
    else
        case "$1" in
        1) way1;;
        2) way2 ;;
        3) way3 ;;
        *) 
        echo -e "wrong enter! \nenter 1, 2 or 3";;
        esac
    fi
}
main $@