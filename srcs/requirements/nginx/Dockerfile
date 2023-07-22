FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install -y nginx openssl gettext-base procps \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/default /etc/nginx/wordpress.conf.template

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT [ "script.sh" ]

CMD ["nginx", "-g", "daemon off;"]