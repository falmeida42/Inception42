#!/bin/bash

# allow external connection
sed -ie 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/port/#port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# initialize the MySQL data directory and create the system tables if they don't exist yet
if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

echo $db_name
# start the service, run the mysql_secure_installation equivalent and set up database and privileged user

mysqld_safe --datadir=/var/lib/mysql & 

sleep 5

# Configure root password
# Deny remote root access
# Delete anonymours users
# Configure mysql and create database and user with set permissions
# Remove test database
mysql --user=root << _EOF_
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pwd';
FLUSH PRIVILEGES;
_EOF_

chown -R mysql:mysql /var/lib/mysql

mysql --user=root --password=$db_root_pwd << _EOF_
CREATE DATABASE IF NOT EXISTS $db_name;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$db_root_pwd';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' IDENTIFIED BY '$db_pwd' WITH GRANT OPTION;
FLUSH PRIVILEGES;
_EOF_

# Needed to stop service in order to run CMD mysqld in Dockerfile
mysqladmin -uroot -p$db_root_pwd shutdown


exec "$@"