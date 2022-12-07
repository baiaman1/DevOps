#!/bin/bash

. ../common.sh

# проверка вводимых данных на валидность
function checkInput {
    nSize="$(echo $size_files | awk -F 'M' '{print $1}')"
    if [[ $# -eq 3 ]] ; then
        if ! [[ $letters_dirs =~ ^[a-zA-Z]{1,7}$ ]] ; then #az
            echo "wrong directory letters"
            exit 1
        elif ! [[ $letters_files =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]] ; then #az.az 
            echo "wrong file letters" 
            exit 1
        elif [ $nSize -gt 100 ] ; then
            echo "max file size 100Mb"
            exit 1
        elif ! [[ $size_files =~ ^[1-9][0-9]?[0]?Mb ]] ; then #3kb
            echo "wrong size of file"
            exit 1
        else 
            genPath
            if [ $? -ne 0 ] ; then
                exit 1
            fi
        fi
    else 
        echo "should be 3 parameters"
        exit 1
    fi
}

function genPath { # /Users/fenixnec/Desktop/test/
    for path in $(find / -type d)
    do
        if [[ $path =~ bin ]] || [[ $path =~ proc ]] || [[ $path =~ dev ]] ; then
            echo ""
        else
            creatFolder $path
            if [ $? -ne 0 ] ; then
                exit 1
            fi
        fi
    done
}

function creatFolder {
    path=$1
    tmpDirName=$letters_dirs
    for ((i=1; i<=$((1 + $RANDOM % 100)); i++))
    do
        if [ ${#tmpDirName} -ge 5 ] & [ $i -ne 1 ] ; then # если количество букв  >= 5 
            tmpDirName=$tmpDirName${tmpDirName: -1}
        else
            while [ ${#tmpDirName} -lt 5 ] # если количество букв меньше 5 добавлятся до 5
            do
                tmpDirName+=${tmpDirName: -1}
            done
        fi

        dirName=$tmpDirName
        dirName+="_"
        dirName+=$(date +"%d%m%y")
        tmpPath=$path/$dirName

        if checkSpace ; then
            mkdir $tmpPath 
            if [ $? -eq 0 ] ; then
                echo "$tmpPath --- $(date +'%e.%m.%Y') ---"  >> file.log 
                creatFile $tmpPath
            else 
                exit 1
            fi
        else 
            echo "less than 1 GB of free space left"
            exit 5
        fi
    done
}

function creatFile {
    tmpPath=$1
    tmpFileName="$(echo $letters_files | awk -F "." '{print $1}')"
    for (( j = 1; j <= $((1 + $RANDOM % 100)); j++ ))
    do
        tmpSize="$(echo $size_files | awk -F "M" '{print $1}')"
        if [ ${#tmpFileName} -ge 4 ] & [ $j -ne 1 ] ; then # если количество букв  >= 4 
            tmpFileName=$tmpFileName${tmpFileName: -1}
        else
            while [ ${#tmpFileName} -lt 4 ] # если количество букв меньше 4 добавлятся до 4
            do
                tmpFileName+=${tmpFileName: -1}
            done
        fi
        fileName=$tmpFileName
        fileName+="_"
        fileName+=$(date +"%d%m%y")
        fileName+="."
        fileName+="$(echo $letters_files | awk -F "." '{print $2}')"

        if checkSpace ; then
            dd if=/dev/zero of=/$tmpPath/$fileName  bs=1024k count=$tmpSize status=none 
            if [ $? -eq 0 ] ; then
                echo $tmpPath/$fileName -- $(date +'%e.%m.%Y') -- $tmpSize  "MB" >> file.log
            else 
                exit 1
            fi
        else 
            echo "less than 1 GB of free space left"
            exit 5
        fi

    done
}