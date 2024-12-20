
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["mariadbd"]
