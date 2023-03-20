#!/bin/bash

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

chown -R mysql:mysql /var/lib/mysql

echo "CREATE USER 'user'@'%' IDENTIFIED BY '123';" | mysql 
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY '123';" | mysql
echo "FLUSH PRIVILEGES;" | mysql  

