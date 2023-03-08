FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

COPY ./conf/www.conf /var/www/html/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
ENTRYPOINT ["create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
