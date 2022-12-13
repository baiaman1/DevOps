
## Part 3. Мини веб-сервер
#### 3.1 Mини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!
![imgs3](./imgs/part3/1_code_fcgi.png)
####
#### 3.2 Cвой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
#### Добавляем новый контекст(раздел) server с директивами.
![imgs3](./imgs/part3/2_context_server.png)
#### 3.3 Выкачываем и запускаем nginx.
![imgs3](./imgs/part3/3_pull_run_nginx.png)
#### 3.4 Копируем файлы server.c и nginx.conf в контейнер.
![imgs3](./imgs/part3/4_copy.png)
#### 3.5 Вход в внутрь контейнера и проверка файлов.
![imgs3](./imgs/part3/5.1_inCont.png)
#### ...
![imgs3](./imgs/part3/5.2_checkFileC.png)
#### 3.6 Обновление контейнера. Установка gcc, spawn-dcgi, libfcgi-dev.
![imgs3](./imgs/part3/6.1_install.png)
#### ...
![imgs3](./imgs/part3/6.2_install.png)
#### ...
![imgs3](./imgs/part3/6.3_install.png)
#### ...
####
#### 3.7 Компиляция и запуск сервера через spawn-fcgi на порту 8080
![imgs3](./imgs/part3/7_compile_run_server.png)
####
#### 3.8 Перезапуск nginx и проверка на http://localhost:81/
![imgs3](./imgs/part3/8.1_reload.png)
![imgs3](./imgs/part3/8.2_check.png)
####
#### 3.9 Положить файл nginx.conf по пути ./nginx/nginx.conf (это понадобится позже)
![imgs3](./imgs/part3/9_dir_nginx.png)
####
#
#### -----------------------------------------------------------------------------------------------------
#
####

## Part 4. Свой докер
####
####
#### Dockerfile
![imgs4](./imgs/part4/1_dockerfile.png)
#### Скрипт start.sh для запуска из докера.
![imgs4](./imgs/part4/2_startsh.png)
#### Собрать написанный докер образ через docker build при этом указав имя и тег
![imgs4](./imgs/part4/3_build.png)
#### Проверить через docker images, что все собралось корректно
#### Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)
![imgs4](./imgs/part4/4_run.png)
#### Проверить, что по localhost:80 доступна страничка написанного мини сервера
#### Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx
#### Перезапустить докер образ

#
#### -----------------------------------------------------------------------------------------------------
#
####
## Part 5. **Dockle**
####
#
#### -----------------------------------------------------------------------------------------------------
#
####
## Part 6. Базовый **Docker Compose**