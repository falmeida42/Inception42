#!/bin/bash

sed -i s/db_name/${db_name}/g /var/www/html/wordpress/wp-config.php
sed -i s/db_user/${db_user}/g /var/www/html/wordpress/wp-config.php
sed -i s/db_pwd/${db_pwd}/g /var/www/html/wordpress/wp-config.php
chown -R www-data:www-data /var/www/html/wordpress

exec "$@"