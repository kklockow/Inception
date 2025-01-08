#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    mysqld_safe --skip-networking &
    # mysqld_safe  &

    pid="$!"
    sleep 5

    mysql --user=root <<-EOSQL
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
        FLUSH PRIVILEGES;
EOSQL

    kill "$pid"
    wait "$pid"
fi

exec "$@"