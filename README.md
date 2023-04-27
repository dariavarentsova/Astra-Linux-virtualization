# Astra-Linux-virtualization

Выполнение кейса 4 CaseLab Support Greenatom

## Contents

оглавление
1
1ю1
1ю2
2
2ю1

## Part 1. Подготовка стенда. 

**== Task 1. Установка **ASTRA LINUX COMMON EDITION** ==**

##### Скачиваем образ диска с сайта **https://mirrors.edge.kernel.org/astra/stable/2.12_x86-64/iso/** (он будет в формате iso)
##### Поднимаем виртуальную машину (далее -- vm1)
![vm1](pictures/1.png)<br>*vm1*<br>
##### Устанавливаем операционную систему
##### клонируем
![vm2](pictures/2.png)<br>*vm2*<br>
##### При настройке сети выбрать подключение к внешней сети через соединение NAT network;
##### проверяем hostname у каждой виртульной машины с помощью команды `hostnamectl`
заменить скрины на хостнейм
##### у vm1 она правильная 
![vm2](pictures/3.png)<br>*vm2*<br>
##### у  vm2   она скопировалать из первой поэтому с помощью команды `hostnamectl set-hostname` меняем hostname на vm2**
![vm2](pictures/4.png)<br>*vm2*<br>
Удостоверяемся что каждая машина имеет разный ip
![vm1](pictures/5.png)<br>*vm1*<br>
![vm2](pictures/6.png)<br>*vm2*<br>

машины должны пинговаться! обьединяем в сеть
salt это
Установка Salt
Следующие действия необходимо выполнить как Master-сервере, так и на управляемых узлах.

Для начала необходимо импортировать ключ репозитория:

wget -O -

https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

Затем необходимо добавить репозиторий с помощью следующей команды:

echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list

Обновите список системных пакетов:

sudo apt update

Установите пакеты Salt, для Master:

sudo apt -y install salt-api salt-cloud salt-master salt-ssh salt-syndic

для Minion:

sudo apt -y install salt-minion

Откройте следующие порты, чтобы компоненты могли взаимодействовать по сети:

sudo ufw allow proto tcp from any to any port 4505,4506
<br>

Настройка Salt Master
С помощью vim открываем файл /etc/salt/master:

 ` sudo vim /etc/salt/master `

 укажите IP-адрес сервера:

` interface: 10.0.3.15 `

После внесения изменений перезагрузите службу:

` /etc/init.d/salt-master restart `

Выведите на экран главный ключ, который необходим для подключения управляемых узлов, выполнив следующую команду:

` sudo salt-key -F master `


Скопируйте содержимое строки master.pub прямо из консоли.

Настройка Salt Minion
По умолчанию Salt Minion пытается подключиться к DNS-имени «salt». С помощью текстового редактора, например vi, откройте файл /etc/hosts:

sudo vim /etc/hosts

Укажите IP-адрес Master Salt и имя salt, например, так:

10.0.3.15 salt

Установите идентификатор для вашей ноды, для этого откройте файл:

sudo vim /etc/salt/minion_id

И вставьте любое удобное и понятное название без пробелов, например:

vm1

Откройте файл конфигурации ноды:

vi /etc/salt/minion

Найдите директиву master_finger и вставьте скопированный ключ master.pub, как показано в примере:

master_finger: '10:e1:34:61:07:03:ba:aa:c2:56:61:ba:bb:1c:af:34:55:e9:a4:66:a1:35:73:00:17:9f:2f:98:d7:71:f3:09'

Сохраните изменения и выполните перезагрузку службы:

/etc/init.d/salt-minion restart


Настройка ключей
Затем подключитесь к Master-ноде и проверьте появившиеся ключи:

sudo salt-key -L

Ожидаемый вывод:
Accepted Keys:

Denied Keys:

Unaccepted Keys:

ubuntu-sys

Rejected Keys:


Примите ключ:

salt-key --accept='ubuntu-sys'

Перед вами появится следующее диалоговое окно:
The following keys are going to be accepted:

Unaccepted Keys:

ubuntu-sys

Proceed? [n/Y] Y

Key for minion ubuntu-sys accepted.

Для проверки выполните следующую команду:

salt-key -L







nginx это
Установка nqinx
sudo apt update
sudo apt install nginx


