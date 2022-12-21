## Part 1. Настройка **gitlab-runner**

#### Скачать и установить на виртуальную машину **gitlab-runner**
#### [Install GitLab Runner](https://docs.gitlab.com/runner/install/linux-repository.html)
#### `curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash`
#### `sudo apt-get install gitlab-runner`
![part1](../misc/images/install.png)
##### Запустить **gitlab-runner** и зарегистрировать его для использования в текущем проекте (*DO6_CICD*)
#### [Register a runner](https://docs.gitlab.com/runner/register/index.html)
`sudo gitlab-runner register`
![part1](../misc/images/reg_gitlab.png)

## Part 2. Сборка
### Написать этап для **CI** по сборке приложений из проекта *C2_SimpleBashScripts*:
#### В файле _gitlab-ci.yml_ добавить этап запуска сборки через мейк файл из проекта _C2_
#### Файлы, полученные после сборки (артефакты), сохранять в произвольную директорию со сроком хранения 30 дней.
![part2](../misc/images/build.png)
![part2](../misc/images/build2.png)

## Part 3. Тест кодстайла
### Написать этап для **CI**, который запускает скрипт кодстайла (*clang-format*):
#### Если кодстайл не прошел, то "зафейлить" пайплайн
#### В пайплайне отобразить вывод утилиты *clang-format*
![part3](../misc/images/styletest.png)
#
#### Failed style test 
![part3](../misc/images/style_fail.png)
#
#### Success style test 
![part3](../misc/images/style_success.png)


### Part 4. Интеграционные тесты

### Написать этап для **CI**, который запускает ваши интеграционные тесты из того же проекта:
#### Запускать этот этап автоматически только при условии, если сборка и тест кодстайла прошли успешно
#### Если тесты не прошли, то "зафейлить" пайплайн
#### В пайплайне отобразить вывод, что интеграционные тесты успешно прошли / провалились
![part4](../misc/images/integration_test.png)
![part4](../misc/images/fail_int_test2.png)
![part4](../misc/images/fail_integration_test.png)
![part4](../misc/images/integration_success.png)

## Part 5. Этап деплоя

### Написать этап для **CD**, который "разворачивает" проект на другой виртуальной машине:
#### Запускать этот этап вручную при условии, что все предыдущие этапы прошли успешно
#### Написать bash-скрипт, который при помощи **ssh** и **scp** копирует файлы, полученные после сборки (артефакты), в директорию */usr/local/bin* второй виртуальной машины
#### В файле _gitlab-ci.yml_ добавить этап запуска написанного скрипта
#### В случае ошибки "зафейлить" пайплайн
![part5](../misc/images/deploy.png)
![part5](../misc/images/deploy_error.png)
![part5](../misc/images/deploy_error_in.png)
![part5](../misc/images/deploy_success.png)
![part5](../misc/images/deploy_success_in.png)

#### В результате вы должны получить готовые к работе приложения из проекта *C2_SimpleBashScripts* (s21_cat и s21_grep) на второй виртуальной машине.
![part5](../misc/images/result_part5.png)

## Part 6. Дополнительно. Уведомления

#### Настроить уведомления о успешном/неуспешном выполнении пайплайна через бота с именем "[ваш nickname] DO6 CI/CD" в *Telegram*
#### - Текст уведомления должен содержать информацию об успешности прохождения как этапа **CI**, так и этапа **CD**.
#### - В остальном текст уведомления может быть произвольным.
![part6](../misc/images/bot.jpg)
![part6](../misc/images/final.png)
