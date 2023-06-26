#!/bin/bash

sed -i -r "s/dbname/$WP_TITLE/1"   /var/www/html/wordpress/wp-config.php
sed -i -r "s/user/$WP_ADMIN_USR/1"  /var/www/html/wordpress/wp-config.php
sed -i -r "s/pwd/$WP_ADMIN_PWD/1"    /var/www/html/wordpress/wp-config.php

chown -R www-data:www-data /var/www/html/wordpress

wp core install --path="/var/www/html/wordpress" --url="falmeida.42.fr" --title="wordpress" --admin_user="falmeida" --admin_password="secret" --admin_email="falemida.42.fr@gmail.com" --allow-root