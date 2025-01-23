FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server && apt-get install -y netcat

ENTRYPOINT ["tail"]

CMD ["-f","/dev/null"]