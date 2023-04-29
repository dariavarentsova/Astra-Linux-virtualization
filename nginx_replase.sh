#!bin/bash
minion=$1
plase=$(pwd)
cd /etc
if [ -n "$1" ]
then

#Архивируем и сжимаем папку с дистрибутивом
sudo tar -cvf nginx_archive.tar.gz nginx/

#Копируем ее на миньон средствами salt
sudo salt-cp $minion nginx_archive.tar.gz /tmp

#Удаляем архив на мастере
sudo rm -rf nginx_archive.tar.gz

else
echo "Не введено ни одного параметра"
fi
cd $plase