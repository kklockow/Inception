
FROM debian:bullseye

RUN apt-get -y update

RUN apt-get install -y wget unzip

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-mbstring php-mysqlnd php-xml php-intl

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +r /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

COPY /conf/wp-config.php /tmp/wp-config.php

RUN chmod +r /tmp/wp-config.php

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


