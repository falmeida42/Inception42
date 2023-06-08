FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx && apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/ST=Lisbon/O=42Lisboa/OU=student/CN=falmeida.42.fr"

COPY conf/default etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]