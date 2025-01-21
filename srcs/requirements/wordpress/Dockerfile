
FROM debian:bullseye

RUN apt-get -y update

RUN apt-get install -y wget unzip

RUN apt-get install -y php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-mbstring php-mysqlnd php-xml php-intl

# RUN wget https://wordpress.org/latest.zip

# RUN mkdir -p /var/www/html/

# RUN unzip -n latest.zip -d /var/www/html/

# COPY /conf/wp-config.php /var/www/html/wordpress/wp-config.php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN chmod +r /var/www/html/wordpress/wp-config.php

RUN chmod +r /etc/php/7.4/fpm/pool.d/www.conf

# RUN chown -R www-data:www-data /var/www/html/wordpress/

# RUN mkdir -p /run/php

EXPOSE 9000

COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

COPY /conf/wp-config.php /tmp/wp-config.php

RUN chmod +r /tmp/wp-config.php

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


