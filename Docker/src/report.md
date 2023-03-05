# Simple Docker

## Part 1. Готовый докер

**== Задание ==**

##### Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`
* ![1.1pullnginx.png](1.1pullnginx.png)  
##### Проверить наличие докер образа через `docker images`
* ![1.2imagels.png](1.2imagels.png)  
##### Запустить докер образ через `docker run -d [image_id|repository]`
* ![1.3run-did.png](1.3run-did.png)  
##### Проверить, что образ запустился через `docker ps`
* ![1.4dockerps.png](1.4dockerps.png)  
##### Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`
* ![1.5inspect.png](1.5inspect.png)  
##### По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера
* ![1.6ports.png](1.6ports.png)
* ![1.7ip.png](1.7ip.png)
* ![1.8size.png](1.8size.png)  
##### Остановить докер образ через `docker stop [container_id|container_name]` & Проверить, что образ остановился через `docker ps`
* ![1.9dockerstopPS.png](1.9dockerstopPS.png)  
##### Запустить докер с замапленными портами 80 и 443 на локальную машину через команду *run* & Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
* Чтобы связка портов 80:443 сработала, необходимо изменить настройки конфигурационного файла /etc/nginx/nginx.conf, установив в нём прослушивание порта 443. Я создал собственный nginx.conf файл (показан в нижнем правом углу на скриншоте) и произвёл копирование с заменой /etc/nginx/nginx.conf в контейнере. После внесённых изменений, задание было выполнено, что видно по скриншоту ниже:  

* ![1.10ports80443.png](1.10ports80443.png)  
##### Перезапустить докер контейнер через `docker restart [container_id|container_name]` & Проверить любым способом, что контейнер запустился (я использовал команду `sudo docker events --filter event=restart --since=1m`)
* ![1.11restartcheck.png](1.11restartcheck.png)  

## Part 2. Операции с контейнером

**== Задание ==**

##### Прочитать конфигурационный файл *nginx.conf* внутри докер образа через команду *exec*
* Определим расположение файла конфигурации командой `sudo docker exec -ti a8942a28ec42 nginx -t`.  
Затем, прочитаем его `sudo docker exec -ti a8942a28ec42 cat /etc/nginx/nginx.conf`  
![2.1exec.png](2.1exec.png)
##### Создать на локальной машине файл *nginx.conf* & Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
* ![2.2nginxconf1.png](2.2nginxconf1.png)
* ![2.2nginxconf2.png](2.2nginxconf2.png)
##### Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp` & Перезапустить **nginx** внутри докер образа через команду *exec* & Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
* ![2.4dockercp.png](2.4dockercp.png)
* ![2.5.2.6.2.7status.png](2.5.2.6.2.7status.png)
##### Экспортировать контейнер в файл *container.tar* через команду *export* & Остановить контейнер & Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры & Удалить остановленный контейнер
* ![2.8exportetc.png](2.8exportetc.png)
##### Импортировать контейнер обратно через команду *import* & Запустить импортированный контейнер & Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
* ![2.8importetc.png](2.8importetc.png)
