
FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y install nginx && \
    apt-get -y install openssl

COPY /conf/nginx.conf /etc/nginx/sites-enabled/default

# COPY /conf/nginx.conf /etc/nginx/nginx.conf

# RUN chown root:www-data /etc/nginx/nginx.conf

# RUN chmod 644 /etc/nginx/nginx.conf

EXPOSE 443/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/certs/key.pem -out /etc/ssl/certs/fullchain.pem -days 365
