
FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y install wordpress

COPY /conf/config-default.php /etc/wordpress/config-default.php