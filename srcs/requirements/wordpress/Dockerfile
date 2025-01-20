
FROM debian:bullseye

RUN apt-get -y update

RUN apt-get install -y wget unzip

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-mbstring php-mysqlnd php-xml php-intl

RUN wget https://wordpress.org/latest.zip

RUN mkdir -p /var/www/html/

RUN unzip -n latest.zip -d /var/www/html/

COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN chmod +r /var/www/html/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress/

RUN mkdir -p /run/php

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
