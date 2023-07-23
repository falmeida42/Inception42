FROM debian:bullseye

ARG	WORDPRESS_VERSION=5.8.3

RUN apt-get update && apt-get install -y \
	gettext \
	php7.4 \
	php7.4-fpm \
	php7.4-cli \
	wget \
	curl \
	procps \
	php7.4-curl \
	php7.4-mysql \
	php7.4-mbstring \
	php7.4-xml \
	php7.4-gd \
	sendmail \
	mariadb-client \
	gettext-base \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	--output-document=/usr/local/bin/wp \
  && chmod +x /usr/local/bin/wp

RUN mkdir -p /run/php /var/www/html/wordpress \
  && chmod -R 755 /var/www/html/

RUN addgroup --system wpg \
  && adduser --system wpg

COPY ./conf/www.conf /www.conf.tmpl

WORKDIR /var/www/html/wordpress

RUN wp core download --allow-root --version=$WORDPRESS_VERSION

COPY tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

RUN rm -f /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT [ "script.sh" ]

CMD [ "/usr/sbin/php-fpm7.4", "-F" ]