
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["mariadbd"]
