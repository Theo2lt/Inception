#!/bin/sh
FILE=wp-config.php
cd /var/www/html

if [ -f "$FILE" ]; then
    echo "$FILE exists." > de
else
    echo "$FILE not exists." > de
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    wp config create --dbname=$BDD_NAME --dbuser=$BDD_USER --dbpass=$BDD_USER_PASSWORD --dbhost=$BDD_HOST --allow-root
    wp core install --url=$DOMAINE_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE --porcelain --allow-root
fi

/usr/sbin/php-fpm7.4 -F