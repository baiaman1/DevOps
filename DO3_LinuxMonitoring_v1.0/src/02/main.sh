#!/bin/bash
# Написать bash-скрипт. Скрипт должен вывести на экран информацию в виде:

. ./out.sh

HOSTNAME=$HOSTNAME 
TIMEZONE="`cat /etc/timezone` `date -u "+%Z"` `date "+%:::z"` "
USER=$USER 
OS=`cat /etc/issue` 
DATE=`date "+%d %b %Y %H:%M:%S"`
UPTIME=`uptime -p`
UPTIME_SEC=`cat /proc/uptime | awk '{print $1}'`
IP=`ip a | grep dynamic | awk '{print $2}'`
MASK=`ifconfig | grep -m1 netmask | awk '{print $4}'`
GATEWAY=`ip route | grep default | awk '{print $3}'`
RAM_TOTAL=`free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}'`
RAM_USED=`free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}'`
RAM_FREE=`free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}'`
SPACE_ROOT=`df /root/ | grep dev/sda | awk '{printf "%.2f MB", $2/1024}'`
SPACE_ROOT_USED=`df /root/ | grep dev/sda | awk '{printf "%.2f MB", $3/1024}'`
SPACE_ROOT_FREE=`df /root/ | grep dev/sda | awk '{printf "%.2f MB", $4/1024}'`

out
choose

if [[ $? -eq 1 ]]
then
    newFile="`date "+%d_%m_%y_%H_%M_%S"`.status"
    out >> $newFile
fi





# После вывода значений предложить записать данные в файл (предложить пользователю ответить Y/N).
# Ответы Y и y считаются положительными, все прочие - отрицательными. При согласии пользователя, в текущей директории создать файл содержащий информацию, которая была выведена на экран.
# Название файла должно иметь вид: DD_MM_YY_HH_MM_SS.status (Время в имени файла должно указывать момент сохранения данных).