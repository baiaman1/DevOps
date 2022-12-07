#!/bin/bash

# main.sh az az.az 3Mb

. ./functions2.sh

res1=$(date +%s.%N)
start=$(date +%H:%M:%S)

export letters_dirs=${1}
export letters_files=${2}
export size_files=${3}

checkInput $@
if [ $? -eq 0 ] ; then
    res2=$(date +%s.%N)
    end=$(date +%H:%M:%S)
    
    ds=$(echo "$res2 - $res1" | bc)
    total=$(LC_NUMERIC=C printf "total running time: %.1fs\n" $ds)

    echo -e "start time: $start \nend time: $end\n$total"
    echo "---- start time: $start | end time: $end | $total" >> file.log
fi

# В конце работы скрипта, вывести на экран:
# *-время начало работы скрипта, 
# *-время окончания 
# *-общее время его работы
# Дополнить этими данными лог файл.

