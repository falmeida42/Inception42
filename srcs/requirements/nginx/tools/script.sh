#!/bin/bash

cat /etc/nginx/wordpress.conf.template | envsubst '$DOMAIN_NAME' > /etc/nginx/sites-available/wordpress.conf

unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42lisboa/CN=falmeida.42.fr" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

exec "$@"