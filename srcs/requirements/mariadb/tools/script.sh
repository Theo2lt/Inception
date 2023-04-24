#!/bin/sh
service mysql start 

/* CREATE USER */
echo "CREATE USER '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql

/* PRIVILGES FOR ROOT AND USER FOR ALL IP ADRESS */ 
echo "GRANT ALL PRIVILEGES ON *.* TO '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql

echo "CREATE DATABASE $BDD_NAME;" | mysql
echo "FLUSH PRIVILEGES;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

