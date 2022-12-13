#!/bin/bash

cd ../
docker-compose build
docker-compose up

docker stop $(docker ps -aq) 
docker rm $(docker ps -aq)  
docker rmi $(docker images -qa)
docker images
docker ps -a