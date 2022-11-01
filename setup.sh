#!/bin/bash
apt-get update -y
apt upgrade -y
apt install apache2 -y
#First perform and apt update
sudo apt update && sudo apt upgrade -y

#Install dependencies
sudo apt install software-properties-common apt-transport-https -y

#Add the PPA
sudo add-apt-repository ppa:ondrej/php -y

#Now to install PHP 8.1 FPM and it's modules
#sudo apt install php8.1-fpm php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl php8.1-bcmath
sudo apt install php8.1 libapache2-mod-php8.1 php8.1-curl php-pear php8.1-gd php8.1-dev php8.1-zip php8.1-mbstring php8.1-mysql php8.1-xml curl -y
systemctl start apache2
systemctl enable apache2
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
cd /var/www/html
composer create-project laravel/laravel projectname --prefer-dist
cd projectname
php artisan
cd ..
chown -R www-data:www-data /var/www/html/projectname
chmod -R 775 /var/www/html/projectname/storage