#!/bin/sh
mkdir -p /var/www/html
rm -rf /var/www/html/web-404 /var/www/html/web-500 /var/www/html/web-subdomain
ls /home
cp -r /home/* /var/www/html/
