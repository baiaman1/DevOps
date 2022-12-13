#!/bin/bash

if [ $# != 0 ] ; then
    echo "script should run without parameters"
else
    goaccess ../04/*.log --log-format=COMBINED > index.html
    echo ""
    if [ $? -eq 0 ] ; then
        echo "results in index.html"
    fi
fi

2
3 2,3
4 комнт в скрипте
7-8 realtime