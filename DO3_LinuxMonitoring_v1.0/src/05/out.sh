#!/bin/bash

function all_folders {
  echo "Total number of folders (including all nested ones) = $(find $1 -type d | wc -l)"
}

function max_five_folders {
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  du -h $1  | sort -hr | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}'
}

function all_files {
  echo "Total number of files = $(ls -laR $1  | grep ^- | wc -l)"
}

function conf_files {
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $(find $1  -type f -name "*.conf" | wc -l)"
  echo "Text files = $(find $1  -type f -name "*.txt" | wc -l)"
  echo "Executable files = $(find $1  -type f -executable | wc -l)"
  echo "Log files (with the extension .log) = $(find $1  -type f -name "*.log" | wc -l)"
  echo "Archive files = $(find $1  -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
  echo "Symbolic links = $(find $1  -type l | wc -l)"
}

function max_ten_files {
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  for i in {1..10}
  do
    out_str=$(find $1  -type f -exec du -h {} \; | sort -rh | sed "${i}q;d")
    if ! [[ -z $out_str ]] 
    then
      echo -n "$i - "
      echo -n "$(echo $out_str | awk '{print $2}'), "
      echo -n "$(echo $out_str | awk '{print $1}'), "
      echo "$(echo $out_str | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    fi
  done
}

function max_ten_exec_files {
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  for i in {1..10}
  do
    out_str=$(find $1  -type f -executable -exec du -h {} + | sort -rh | sed "${i}q;d")
    if ! [[ -z $out_str ]]
    then
      echo -n "$i - "
      echo -n "$(echo $out_str | awk '{print $2}'), "
      echo -n "$(echo $out_str | awk '{print $1}'), "

      path=$(echo $out_str | awk '{print $2}')
      hash=$(md5sum $path | awk '{print $1}')
      echo "$hash"
    fi
  done
}