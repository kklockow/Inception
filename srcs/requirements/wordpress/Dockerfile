
FROM debian:bullseye

RUN apt-get -y update

RUN apt-get install -y wget unzip

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip

RUN wget https://wordpress.org/latest.zip

RUN mkdir -p /var/www/html/

RUN unzip -n latest.zip -d /var/www/html/

COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN chmod +r /var/www/html/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress/

RUN mkdir -p /run/php

# RUN chown -R mysql:mysql /run/mysqld

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]