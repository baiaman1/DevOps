#!/bin/bash

docker build -t rep_name:tag_name .
docker run -it --name cont_name -p 80:81 -v ~/Desktop/DO5_SimpleDocker-0/src/part4/nginx/nginx.conf:/etc/nginx/nginx.conf -d rep_name:tag_name bash
open http://localhost:80/