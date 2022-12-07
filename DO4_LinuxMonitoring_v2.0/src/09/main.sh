#!/bin/bash

for ((i=1; i=1; )); do
    >index.html
    echo "cpu $(cat /proc/loadavg | awk '{print $1}')">>index.html
    echo "mem_avail $(free | grep Mem | awk '{print $7}')">>index.html
    echo "disk_avail $(df /| grep / | awk '{print $4}')">>index.html
    sleep 3
done
