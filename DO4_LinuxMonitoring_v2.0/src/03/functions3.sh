#!/bin/bash

function way1 {
    logs="$(cat ../02/file.log | awk -F ' ' '{print $1}')"
    reg='^\/'
    for i in $logs
    do
        if [[ $i =~ $reg ]]
        then
            rm -rf $i
        fi
    done
    if [ $? -eq 0 ] ; then
        echo "cleared"
    fi
}

function way2 {
    dateNow=$(date +%Y%m%d)
    read -p "Write START date and time(YYYY-MM-DD HH:MM): " start
    read -p "Write END date and time(YYYY-MM-DD HH:MM): " end

    path=$(find / -type d -newermt "$dateNow $start" \! -newermt "$dateNow $end"  2>/dev/null)
    if [ -z "$path" ] ; then
        echo "no data to clear"
    else
        for i in $path
        do
            if [[ $path =~ bin ]] || [[ $path =~ proc ]] || [[ $path =~ dev ]] ; then
                echo ""
            else
                rm -rf $i 2> /dev/null
            fi
        done
        echo "cleared"
    fi
}

function way3 {
    read -p "Write searching mask(abcd_DDMMYY): " mask
    find / -name $mask | grep .
    if [ $? -eq 0 ] ; then
        find / -name $mask | xargs rm -rf 2>/dev/null
        if [ $? -eq 0 ] ; then
            echo "file $mask deleted"
        else echo "failed to remove $mask"
        fi
    else echo ""$mask" could not be found"
    fi
}
