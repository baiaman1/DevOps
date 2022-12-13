

#!/bin/bash

function out {
    echo -e "${col1_back}${col1_font} HOSTNAME        ${def_colrs} = ${col2_back}${col2_font}$HOSTNAME${def_colrs}"
    echo -e "${col1_back}${col1_font} TIMEZONE        ${def_colrs} = ${col2_back}${col2_font}${col2_back}${col2_font}$TIMEZONE${def_colrs}"
    echo -e "${col1_back}${col1_font} USER            ${def_colrs} = ${col2_back}${col2_font}$USER${def_colrs}"
    echo -e "${col1_back}${col1_font} OS              ${def_colrs} = ${col2_back}${col2_font}$OS${def_colrs}"
    echo -e "${col1_back}${col1_font} DATE            ${def_colrs} = ${col2_back}${col2_font}$DATE${def_colrs}"
    echo -e "${col1_back}${col1_font} UPTIME          ${def_colrs} = ${col2_back}${col2_font}$UPTIME${def_colrs}"
    echo -e "${col1_back}${col1_font} UPTIME_SEC      ${def_colrs} = ${col2_back}${col2_font}$UPTIME_SEC${def_colrs}"
    echo -e "${col1_back}${col1_font} IP              ${def_colrs} = ${col2_back}${col2_font}$IP${def_colrs}"
    echo -e "${col1_back}${col1_font} MASK            ${def_colrs} = ${col2_back}${col2_font}$MASK${def_colrs}"
    echo -e "${col1_back}${col1_font} GATEWAY         ${def_colrs} = ${col2_back}${col2_font}$GATEWAY${def_colrs}"
    echo -e "${col1_back}${col1_font} RAM_TOTAL       ${def_colrs} = ${col2_back}${col2_font}$RAM_TOTAL${def_colrs}"
    echo -e "${col1_back}${col1_font} RAM_USED        ${def_colrs} = ${col2_back}${col2_font}$RAM_USED${def_colrs}"
    echo -e "${col1_back}${col1_font} RAM_FREE        ${def_colrs} = ${col2_back}${col2_font}$RAM_FREE${def_colrs}"
    echo -e "${col1_back}${col1_font} SPACE_ROOT      ${def_colrs} = ${col2_back}${col2_font}$SPACE_ROOT${def_colrs}"
    echo -e "${col1_back}${col1_font} SPACE_ROOT_USED ${def_colrs} = ${col2_back}${col2_font}$SPACE_ROOT_USED${def_colrs}"
    echo -e "${col1_back}${col1_font} SPACE_ROOT_FREE ${def_colrs} = ${col2_back}${col2_font}$SPACE_ROOT_FREE${def_colrs}"
}

function colors {
    result=0

    case "$1" in
        1) result=7 ;; #white
        2) result=1 ;; #red
        3) result=2 ;; #green
        4) result=4 ;; #blue
        5) result=5 ;; #purple
        6) result=0 ;; #black
    esac

    return $result
}