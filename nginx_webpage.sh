#!bin/bash
minion=$1
if [ -n "$1" ]
then

# Удаляем стартовую страницу на миньоне
sudo salt $minion cmd.run 'sudo rm -rf /var/www/html/index.nginx-debian.html'

# Отправляем на миньон нужную страницу с мастера
sudo salt-cp $minion index.nginx-debian.html /var/www/html

else
echo "Не введено ни одного параметра"
fi