#!bin/bash
minion=$1
if [ -n "$1" ]
then

# Разархивируем папку с nginx
sudo salt $minion cmd.run 'sudo tar -xvf /tmp/nginx_archive.tar.gz -C /tmp'

# Удаляем ненужный архив
sudo salt $minion cmd.run 'sudo rm -rf /tmp/nginx_archive.tar.gz'

# Устанавливаем nginx
sudo salt $minion cmd.run 'sudo apt install nginx'

# Разрешаем трафик на порту 80.
sudo salt $minion cmd.run 'sudo ufw allow "Nginx HTTP'

# Запускаем веб-сервер
sudo salt $minion cmd.run 'sudo systemctl start nginx'

else
echo "Не введено ни одного параметра"
fi