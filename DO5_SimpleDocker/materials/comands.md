
## Part 1. Готовый докер
#### Comands:
####
#### `docker pull nginx` - скачать образ nginx
#### `docker images` - проверить наличие образов
#### `docker run -d nginx` - запуск образа nginx
#### `docker ps` - запущенные контейнеры
#### `docker inspect container_id` инфо о контейнере  
#### `docker stop container_id` - остановить контейнер
#### `docker run -d -p 80:80 -p 443:443 image_id` - запусить новый контейнер на портах 80 и 443
#### `docker restart container_id` - перезапуск контейнера
####
#


## Part 2. Операции с контейнером
#### Comands:
####
#### `docker exec container_id cat /path/file.txt` - просмотр файла из контейнера
#### `docker cp file.txt container_id:/path/` -  копировать файл в внутрь контейнера
#### `docker exec container_id nginx -s reload` - перезапустить nginx внутри докер образа
#### `docker export container_id > container.tar` - экспортировать контейнер в файл container.tar
#### `docker rmi image_id -f` - удалить образ(image), не удаляя контейнеры
#### `docker rm container_id` - удалить контейнер
#### `docker  import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' container.tar nginx1` - импортировать контейнер
####
#


## Part 3. Мини веб-сервер
#### Comands:
####
#### `docker exec -it [container_id|container_name] bash` - вход в контейнер
####
#

## Part 4. Свой докер
#### Comands:
####
#### `docker build -t rep_name:tag_name .`
#### `docker run -it --name cont_name -p 80:81 -v /Users/fenixnec/Desktop/DO5_SimpleDocker-0/src/server/nginx/nginx.conf:/etc/nginx/nginx.conf -d rep_name:tag_name bash`
####
#

## Part 5. **Dockle**
#### Comands:
####
#### `export DOCKER_CONTENT_TRUST=1`
#### `dockle --accept-key=NGINX_GPGKEY rep_name:tag_name`
####
#

## Part 6. Базовый **Docker Compose**
#### Comands:
####
#### `docker-compose build`
#### `docker-compose up`
####
#

