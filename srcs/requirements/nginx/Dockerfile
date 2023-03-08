FROM debian:buster

#Install nginx with RUN
RUN apt-get update && apt-get -y install nginx \
openssl \
&& rm -rf /var/lib/apt/lists/*

#Generate a self certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/falmeida.42.fr.pem -keyout /etc/ssl/falmeida.42.fr.key -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/OU=falmeida/CN=falmeida.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
