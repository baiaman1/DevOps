#!/bin/bash

docker pull nginx
docker run -d -p 81:81 --name cont_name nginx
docker cp server.c cont_name:/etc/nginx/server.c 
docker cp nginx/nginx.conf cont_name:/etc/nginx/nginx.conf
docker exec cont_name apt-get update
docker exec cont_name apt-get install -y gcc spawn-fcgi libfcgi-dev  
docker exec cont_name gcc /etc/nginx/server.c -o /etc/nginx/exemple_name_server -l fcgi
docker exec cont_name spawn-fcgi -p 8080 /etc/nginx/exemple_name_server
docker exec cont_name nginx -s reload    
open http://localhost:81/