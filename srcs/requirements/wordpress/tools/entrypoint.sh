#!/bin/bash

mkdir -p /run/php
chown -R www-data:www-data /run/php

if [ ! -d "/var/www/html/wordpress" ]; then

    wget https://wordpress.org/latest.zip

    mkdir -p /var/www/html/

    unzip -n latest.zip -d /var/www/html/

    cp "/tmp/wp-config.php" "/var/www/html/wordpress/wp-config.php"

    chown -R www-data:www-data /var/www/html/wordpress/

    chmod -R 777 /var/www/html/wordpress

fi

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core install --path="/var/www/html/wordpress" --allow-root --url="kklockow.42.fr" --title="inception" --admin_user="$WORDPRESS_DB_USER" --admin_password="$WORDPRESS_DB_PASSWORD" --admin_email="inception@email.com"

wp user create --path="/var/www/html/wordpress" --allow-root $RANDOM_USER_NAME $RANDOM_USER_EMAIL --user_pass=$RANDOM_USER_PASS --display_name=$RANDOM_USER_NAME

echo "done with stuff---------------------"

/usr/sbin/php-fpm7.4 --nodaemonize
