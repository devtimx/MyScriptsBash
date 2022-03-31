#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ejecutarse como root" 1>&2
    exit 1
fi
MYPASSWORD="toor"
clear
echo " *** SCRIPT POST INSTALACION BASICA DEBIAN *** "
# paquetes basicos previos a la instalacion del sistema
sudo apt update
echo " *** INSTALACION DE PAQUETES BASICOS *** "
apt-get install -y linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') build-essential make automake cmake autoconf git aptitude synaptic sed
apt install -y bzip2 zip unzip unace rar unace p7zip p7zip-full p7zip-rar unrar lzip lhasa arj sharutils mpack lzma lzop cabextract
sudo apt install -y lsb-release ca-certificates apt-transport-https software-properties-common
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y php8.0
apt-get install -y software-properties-common dirmngr apt-transport-https
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
add-apt-repository 'deb [arch=amd64] https://ftp.osuosl.org/pub/mariadb/repo/10.5/debian buster main'

apt-get update
apt install -y mariadb-server-core-10.5 mariadb-server-10.5 mariadb-client-core-10.5 mariadb-client-10.5

apt install -y nginx
apt install -y libssl-dev
apt install -y php 
apt install -y php-xml
apt install -y php-json
apt install -y php-cli
apt install -y php-mcrypt
apt install -y php-opcache
apt install -y php-pgsql
apt install -y php-mysql
apt install -y php-pdo-mysql
apt install -y php-readline
apt install -y php-soap
apt install -y php-mbstring
apt install -y php-dom
apt install -y php-gd
apt install -y php-intl
apt install -y php-xsl
apt install -y php-zip
apt install -y php-curl
apt install -y npm

echo " *** INSTALACION DE COMPOSER *** "
#instalacion de composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
