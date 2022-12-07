#!/bin/bash

date="$(date +%Y)-$(date +%m)-$(date +%d) 00:00:00 $(date +%z)"

if [ $# != 0 ] ; then
    echo "script should run without parameters"
    exit 1
else
    seconds=$(shuf -i 10-60 -n1)
    rand=$(shuf -n1 -i 100-1000)
    for (( i=5; i>0; i-- ))
    do
        for (( j=0; j<rand; j++ ))
        do
            echo -n "$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255)" >> $i.log
            if [ $? -ne 0 ] ; then
                exit 1
            fi
            echo -n " - - " >> $i.log
            echo -n "[$(date -d "$date + $seconds seconds"  +'%d/%b/%Y:%H:%M:%S %z')] " >> $i.log
            echo -n "\"$(shuf -n1 ./values/methods) " >> $i.log
            echo -n "$(shuf -n1 ./values/urls) " >> $i.log
            echo -n "$(shuf -n1 ./values/protocols)\" " >> $i.log
            echo -n "$(shuf -n1 ./values/codes)" >> $i.log
            echo -n " \"-\" " >> $i.log
            echo "\"$(shuf -n1 ./values/agents)\"" >> $i.log
            ((seconds+=$(shuf -i 10-60 -n1) ))
        done
        date="$(date +%Y)-$(date +%m)-$(date +%d) 00:00:00 $(date +%z)"
        date="$(date -d "$date - $((6-$i)) days" +'%Y-%m-%d')"
    done
    if [ $? -eq 0 ] ; then
        echo "logs successfully created"
    fi
fi

# 200 - OK
# 201 - CREATED
# 400 - BAD_REQUEST
# 401 - UNAUTHORIZED
# 403 - FORBIDDEN
# 404 - NOT_FOUND
# 500 - INTERNAL_SERVER_ERROR
# 501 - NOT_IMPLEMENTED
# 502 - BAD_GATEWAY
# 503 - SERVICE_UNAVAILABLE