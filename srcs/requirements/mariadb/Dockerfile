
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server && apt-get install -y iputils-ping

COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd"]

