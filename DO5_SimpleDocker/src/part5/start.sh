#!/bin/bash

# gcc server.c -lfcgi -o server
service nginx start
# nginx -s reload
spawn-fcgi -p 8080 ./server
tail -f /dev/null