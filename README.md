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
проверяем hostname у каждой виртульной машины с помощью команды hostnamectl 
у vm1 она правильная 
![vm2](pictures/3.png)<br>*vm2*<br>
у  vm2   она скопировалать из первой поэтому с помощью команды 
hostnamectl set-hostname меняем hostname на vm2
![vm2](pictures/4.png)<br>*vm2*<br>

<br>

