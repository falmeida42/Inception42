#!/bin/bash

set -x 

# Create the wordpress config file
wp config create --allow-root \
    --dbname=$db_name \
    --dbuser=$db_user \
    --dbpass=$db_pwd \
    --dbhost=$db_host

chmod 600 wp-config.php

if wp core is-installed --allow-root; then
	echo "Wordpress core already installed"
else

# Installs wordpress
wp core install --allow-root \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USR \
    --admin_email=$WP_ADMIN_EMAIL \
    --admin_password=$WP_ADMIN_PWD

# create a new user
wp user create --allow-root \
    $WP_USR \
    $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PWD

 # Turns off debugging which is needed when using CLI from container
wp config set WORDPRESS_DEBUG false --allow-root

wp plugin update --all --allow-root

# Sets the correct port to listen to nginx
sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' \
/etc/php/7.3/fpm/pool.d/www.conf

chown -R wpg:wpg /var/www/html/*

touch /usr/local/bin/.docker-entrypoint-finished
echo "Created .docker-entrypoint-finished"

exec "$@"