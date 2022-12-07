#!/bin/bash

. ../common.sh

# проверка вводимых данных на валидность
function checkInput {
    nSize="$(echo $6 | awk -F 'k' '{print $1}')"
    if [[ $# -eq 6 ]] ; then
        if ! [[ -d $1 ]] ; then #isFloder /opt/test 
            echo "\"$1\" is not directory"
            exit 1
        elif [[ $1 =~ [.] ]] ; then
            echo "enter only absolute path"
            exit 1
        elif ! [[ $2 =~ ^[0-9]+$ ]] ; then #4
            echo "wrong number of subfolders"
            exit 1
        elif ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]] ; then #az
            echo "wrong letters"
            exit 1
        elif ! [[ $4 =~ ^[0-9]+$ ]] ; then #5
            echo "wrong number of files"
            exit 1
        elif ! [[ $5 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]] ; then #az.az 
            echo "wrong format of file" 
            exit 1
        elif [ $nSize -gt 100 ] ; then
            echo "max file size 100Mb"
            exit 1
        elif ! [[ $6 =~ ^[1-9][0-9]?[0]?kb ]] ; then #3kb
            echo "wrong size of file"
            exit 1
        else creatFolder #"input is correct!"
        fi
    else 
        echo "should be 6 parameters"
        exit 1
    fi
}

# создание папок
function creatFolder {
    tmpDirName=$letters_dirs
    for (( i = 1; i <= $count_dirs; i++ ))
    do
        if [ $count_dirs -lt 255 ] ; then
            genDirName $tmpDirName
        else
            echo "letter limit reached"
            exit 1
        fi
        dirName=$tmpDirName
        dirName+="_"
        dirName+=$(date +"%d%m%y")
        tmpPath=$path/$dirName

        if checkSpace ; then
            mkdir $tmpPath
            if [ $? -eq 0 ] ; then
                echo $tmpPath --- $(date +'%e.%m.%Y') ---  >> file.log 
                creatFile $tmpPath
            else 
                exit 1
            fi
             
        else 
            echo "less than 1 GB of free space left"
            exit 1
        fi
    done
}

function genDirName {
    tmpDirName=$1
    if [ ${#tmpDirName} -ge 4 ] & [ $i -ne 1 ] ; then # если количество букв  >= 4 
        tmpDirName=$tmpDirName${tmpDirName: -1}
    else
        while [ ${#tmpDirName} -lt 4 ] # если количество букв меньше 4 добавлятся до 4
        do
            tmpDirName+=${tmpDirName: -1}
        done
    fi 
}

# создание файлов
function creatFile {
    tmpPath=$1
    tmpFileName="$(echo $letters_files | awk -F "." '{print $1}')"
    for (( j = 1; j <= $count_files; j++ ))
    do
        tmpSize="$(echo $size_files | awk -F "k" '{print $1}')"

        if [ $count_files -lt 241 ] ; then
            if [ ${#tmpFileName} -ge 4 ] & [ $j -ne 1 ] ; then # если количество букв  >= 4 
                tmpFileName=$tmpFileName${tmpFileName: -1}
            else
                while [ ${#tmpFileName} -lt 4 ] # если количество букв меньше 4 добавлятся до 4
                do
                    tmpFileName+=${tmpFileName: -1}
                done
            fi
        else
            echo "letter limit reached"
            exit 1
        fi
        fileName=$tmpFileName
        fileName+="_"
        fileName+=$(date +"%d%m%y")
        fileName+="."
        fileName+="$(echo $letters_files | awk -F "." '{print $2}')"
        tmpSize+="k"

        if checkSpace ; then
            dd if=/dev/zero of=/$tmpPath/$fileName  bs=$tmpSize count=1 status=none 
            if [ $? -eq 0 ] ; then
                echo $tmpPath/$fileName --- $(date +'%e.%m.%Y') --- $tmpSize "Kb" >> file.log
            else 
                exit 1
            fi
        else 
            echo "less than 1 GB of free space left"
            exit 1
        fi

    done
}


