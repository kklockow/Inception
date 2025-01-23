#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

echo "Hi im Entrypoint"

# if [ ! -d "/var/lib/mysql/mysql" ]; then

echo "Running mysql_install_db"
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

mysqld_safe &
pid="$!"

echo "[CMDB]Waiting for MariaDB to be ready..."
until mysqladmin ping -h localhost --silent; do
    echo "[CMDB]MariaDB not yet available. Retrying..."
    sleep 2
done

mysql --user=root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "Shutting down MariaDB..."
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

wait "$pid"
echo "MariaDB setup complete."

# fi

echo "Hi that was me, Entrypoint"

exec "$@"
