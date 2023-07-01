FROM debian:buster

WORKDIR /var/www/html/

RUN apt-get update \
    && apt-get upgrade -yq \
    && apt-get install -yq wget openssl mariadb-client php php-fpm php-mysqli php-curl php-gd php-xml php-cgi php-http gettext

RUN apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvf latest.tar.gz \
    && rm -rf latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN rm /var/www/html/wordpress/wp-config-sample.php

RUN mkdir /run/php/ \
    && touch /run/php/php7.3-fpm.pid

RUN chmod -R 755 /var/www/html/wordpress

ENTRYPOINT ["script.sh"]

CMD ["php-fpm7.3", "-F", "-R"]