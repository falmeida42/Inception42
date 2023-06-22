#!/bin/bash



service mysql start 


echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db.sql
echo "GRANT USAGE ON *.* TO '$db_user'@'%';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld