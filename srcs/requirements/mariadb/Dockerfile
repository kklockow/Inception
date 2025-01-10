
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server && apt-get install -y netcat

COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN chmod +r /etc/mysql/conf.d/mysql.cnf

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd"]

# CMD ["mysql_install_db --user=mysql --datadir=/var/lib/mysql"]
