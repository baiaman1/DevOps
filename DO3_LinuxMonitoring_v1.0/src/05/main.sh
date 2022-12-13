#!/bin/bash
source ./out.sh
res1=$(date +%s.%N)
if [[ -n $1 ]]
then
    if [[ -d $1 ]]
    then
        if [[ ${1: -1} = "/" ]]
        then
            all_folders $1
            max_five_folders $1
            all_files $1
            conf_files $1
            max_ten_files $1
            max_ten_exec_files $1
            res2=$(date +%s.%N)
            ds=$(echo "$res2 - $res1" | bc)
            LC_NUMERIC=C printf "Script execution time (in seconds) = %.1f\n" $ds
        else
            echo "Directory should end with '/'"
        fi
    else
        echo "Directory not exist"
    fi
else
    echo "Parameter is required. Try again."
fi

