#!bin/bash
sudo su
apt-get update -y
apt upgrade -y
apt install apache2 -y
apt install php8.1 libapache2-mod-php8.1 php8.1-curl php-pear php8.1-gd php8.1-dev php8.1-zip php8.1-mbstring php8.1-mysql php8.1-xml curl -y