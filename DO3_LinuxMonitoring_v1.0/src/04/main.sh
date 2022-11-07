#!/bin/bash
. ./config.conf
source ./out.sh



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

renge="^[1-6]$"
default=0
if ! [[ $column1_background =~ $renge ]] || ! [[ $column1_font_color =~ $renge ]] || 
   ! [[ $column2_background =~ $renge ]] || ! [[ $column2_font_color =~ $renge ]]
then
    background1=6
    text1=1
    background2=6
    text2=1
    default=1
    print $background1 $text1 $background2 $text2
else
    print ${column1_background} ${column1_font_color} ${column2_background} ${column2_font_color}
fi    