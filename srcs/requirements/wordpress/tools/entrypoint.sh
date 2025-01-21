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

echo "done with stuff---------------------"

/usr/sbin/php-fpm7.4 --nodaemonize
# exec "$@"

# ./usr/sbin/php-fpm7.4
