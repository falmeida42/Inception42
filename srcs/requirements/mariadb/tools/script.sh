#!/bin/bash

# initialize the MySQL data directory and create the system tables if they don't exist yet
if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

fi

# start the service, run the mysql_secure_installation equivalent and set up database and privileged user
if [ ! -d "/var/lib/mysql/$db_name" ]; then

service mysql start

# Configure root password
# Deny remote root access
# Delete anonymours users
# Configure mysql and create database and user with set permissions
# Remove test database
mysql --user=root << EOF
UPDATE mysql.user SET Password=PASSWORD('$db_root_pwd') WHERE User='root';
UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root' AND host='localhost';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

chown -R mysql:mysql /var/lib/mysql

mysql --user=root --password=$db_root_pwd << EOF
CREATE DATABASE IF NOT EXISTS $db_name;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$db_root_pwd';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' IDENTIFIED BY '$db_pwd' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Needed to stop service in order to run CMD mysqld in Dockerfile
service mysql stop
fi

exec "$@"