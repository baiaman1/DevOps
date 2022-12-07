#!/bin/bash

# /path 4 az 5 az.az 3kb

. ./functions.sh

export path=${1}
export count_dirs=${2}
export letters_dirs=${3}
export count_files=${4}
export letters_files=${5}
export size_files=${6}

checkInput $@
if [ $? -eq 0 ] ; then
    echo "successfully created"
fi
