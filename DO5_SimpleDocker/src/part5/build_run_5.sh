#!/bin/bash

docker build -t rep_name:tag_name .
docker run -it --name cont_name -p 80:81 -v ~/Desktop/DO5_SimpleDocker-0/src/part5/nginx/nginx.conf:/etc/nginx/nginx.conf -d rep_name:tag_name bash
export DOCKER_CONTENT_TRUST=1
open http://localhost:80/
dockle --accept-key=NGINX_GPGKEY rep_name:tag_name 
if [ $? -ne 0 ] ; then
    echo "dockle ERROR"
else 
    echo "dockle success"
fi
