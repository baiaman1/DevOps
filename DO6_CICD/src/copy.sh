#!/bin/bash

# on machine 1:
# sudo su - gitlab-runner
# echo "1"
# ssh-keygen -t rsa -b 2048
# ssh-copy-id fenixnec@192.168.1.2

scp src/cat/s21_cat src/grep/s21_grep fenixnec@192.168.1.2:/usr/local/bin

