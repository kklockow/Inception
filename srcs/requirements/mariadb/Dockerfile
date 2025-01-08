
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd"]

# CMD ["mysql_install_db --user=mysql --datadir=/var/lib/mysql"]
