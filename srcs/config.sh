#!/bin/bash

# set variables
WP=https://wordpress.org/latest.tar.gz
PMA=https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz
ROOT=/var/www

# launch services
service nginx start
service mysql start
service php7.3-fpm start

chown -R www-data: $ROOT

# install wordpress
wget -c $WP -O - | tar -xz -C $ROOT
chown -R www-data: $ROOT/wordpress

# install phpmyadmin
wget -c $PMA -O - | tar -xz -C $ROOT
mv $ROOT/phpMyAdmin-4.9.2-english $ROOT/phpmyadmin
chown -R www-data: $ROOT/phpmyadmin

# server configuration
if  [ $AUTO_INDEX = "off" ]
then
    sed -i 's/autoindex on;/autoindex off;\n\troot \/var\/www\/html;/g' srcs_docker/nginx-block
fi
cp srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block
ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
rm -rf /etc/nginx/sites-enabled/default

rm $ROOT/html/index.nginx-debian.html
mv srcs_docker/index.html $ROOT/html

# SSL configuration
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < srcs_docker/certificate

# data base initialisation
mysql < srcs_docker/create_db.sql

# Relaunch nginx
service nginx restart

/bin/sh