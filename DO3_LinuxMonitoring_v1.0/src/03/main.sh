#!/bin/bash
. ./out.sh

if [[ -n $5 ]]
then
    echo "Too much parameters. Try again."
else
    if [[ -n $4 ]]
    then
        range="^[1-6]$"

        if [[ $1 =~ $range ]] && [[ $2 =~ $range ]] && [[ $3 =~ $range ]] && [[ $4 =~ $range ]]
        then
            if [[ $1 == $2 ]] || [[ $3 == $4 ]]
            then
                echo "The font and background colors must not match. Try again."
            else
                HOSTNAME=$(hostname)
                timedatectl set-timezone Europe/Moscow
                TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
                USER=$(whoami)
                OS=$(cat /etc/issue | awk '{print $1,$2,$3}' | tr -s '\r\n' ' ')
                DATE=$(date "+%d %b %Y %H:%M:%S")
                UPTIME=$(uptime -p)
                UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
                IP=$(ip addr show | grep "dynamic enp0s3" | awk '{print $2}')
                MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}')
                GATEWAY=$(ip route | grep default | awk '{print $3}')
                RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
                RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
                RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
                SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
                SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
                SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

                colors $1
                col1_back="\033[4$?m"
                colors $2
                col1_font="\033[3$?m"
                colors $3
                col2_back="\033[4$?m"
                colors $4
                col2_font="\033[3$?m"
                def_colrs="\033[37m\033[0m"

                out
            fi
        else
            echo "Wrong range of colors. Try again."
        fi
    else
        echo "Not enough parameters. Try again."
    fi
fi