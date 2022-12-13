#!/bin/bash

function print {
    get_color $1
    col1_back="\033[4$?m"
    get_color $2
    col1_font="\033[3$?m"
    get_color $3
    col2_back="\033[4$?m"
    get_color $4
    col2_font="\033[3$?m"
    def_colrs="\033[37m\033[0m"
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
    print_info_about_color $default
}

function get_color {
    result=0

    case "$1" in
        1) result=7 ;;
        2) result=1 ;;
        3) result=2 ;;
        4) result=4 ;;
        5) result=5 ;;
        6) result=0 ;;
    esac

    return $result
}

function print_info_about_color {
    echo -e "\nColumn 1 background = $(if [[ $1 -eq 1 ]] ; then echo "defulat (black)" ; else echo -n ${column1_background}; print_color_text ${column1_background}; fi)"
    echo "Column 1 font color = $(if [[ $1 -eq 1 ]] ; then echo "defulat (white)" ; else echo -n ${column1_font_color}; print_color_text ${column1_font_color}; fi) "
    echo "Column 2 background = $(if [[ $1 -eq 1 ]] ; then echo "defulat (black)" ; else echo -n ${column2_background}; print_color_text ${column2_background}; fi)"
    echo "Column 2 font color = $(if [[ $1 -eq 1 ]] ; then echo "defulat (white)" ; else echo -n ${column2_font_color}; print_color_text ${column2_font_color}; fi)"
}

function print_color_text {
    case "$1" in
        1) echo " (white)" ;;
        2) echo " (red)" ;;
        3) echo " (green)" ;;
        4) echo " (blue)" ;;
        5) echo " (purple)" ;;
        6) echo " (black)" ;;
    esac
}