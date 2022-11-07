#!/bin/bash

function out {
    echo "HOSTNAME = $HOSTNAME" #сетевое имя
    echo "TIMEZONE = $TIMEZONE" #временная зона в виде: America/New_York UTC -5 
    echo "USER = $USER" #текущий пользователь который запустил скрипт
    echo "OS = $OS" #тип и версия операционной системы
    echo "DATE = $DATE" #текущее время в виде: 12 May 2020 12:24:36
    echo "UPTIME = $UPTIME" #время работы системы
    echo "UPTIME_SEC = $UPTIME_SEC" #время работы системы в секундах
    echo "IP = $IP" #ip-адрес машины в любом из сетевых интерфейсов
    echo "MASK = $MASK" #сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
    echo "GATEWAY = $GATEWAY" #ip шлюза по умолчанию
    echo "RAM_TOTAL = $RAM_TOTAL" #размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
    echo "RAM_USED = $RAM_USED" #размер используемой памяти в Гб c точностью три знака после запятой
    echo "RAM_FREE = $RAM_FREE" #размер свободной памяти в Гб c точностью три знака после запятой
    echo "SPACE_ROOT = $SPACE_ROOT" #размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED" #размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE" #размер свободного пространства рутового раздела в Mб с точностью два знака после запятой
}

function choose {
    read -p "Do you want to save the data to a file? (Y/N):" ch
    result=0

    if [ "$ch" == "y" ] || [ "$ch" == "Y" ]
    then
        result=1
    fi

    return $result
}