#!/bin/sh

service mysql start 

/* CREATE USER */
echo "CREATE USER '$BDD_WORDPRESS_USER'@'%' IDENTIFIED BY '$BDD_WORDPRESS_USER_PASSWORD';" | mysql

/* PRIVILGES FOR ROOT AND USER FOR ALL IP ADRESS */ 
echo "GRANT ALL PRIVILEGES ON *.* TO '$BDD_WORDPRESS_USER'@'%' IDENTIFIED BY '$BDD_WORDPRESS_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$BDD_PASSWORD_ROOT';" | mysql

echo "CREATE DATABASE wordpress;" | mysql
echo "FLUSH PRIVILEGES;" | mysql


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

