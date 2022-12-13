#!/bin/bash

function way1 {
    for (( i=1; i<6; i++ ))
    do
        sort -k 9 ../04/$i.log -o w1_sortByCode_$i.log
        echo "$(pwd)"
    done
}

function way2 {
    for (( i=1; i<6; i++ ))
    do
        awk '{print $1}' ../04/$i.log | sort | uniq -u > w2_uniqIP_$i.log
    done
}

function way3 {
    for (( i=1; i<6; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log > w3_errReqts_$i.log
    done
}

function way4 {
    for (( i=1; i<6; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log | awk '{print $1}' | sort | uniq -u > w4_uErrReq_$i.log
    done
}