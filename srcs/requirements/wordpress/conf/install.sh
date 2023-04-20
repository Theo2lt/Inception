#!/bin/sh
FILE=wp-config.php
cd /var/www/html

if [ -f "$FILE" ]; then
    echo "$FILE exists." > deb
else
    echo "$FILE not exists." > deb
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root 
    sleep 5
    wp config create --dbname=$BDD_NAME --dbuser=$BDD_USER --dbpass=$BDD_USER_PASSWORD --dbhost=$BDD_HOST --allow-root 
    sleep 5
    wp core install --url=$DOMAINE_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root  >> deb
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE --porcelain --allow-root 
    wp theme install neve --activate --allow-root  
    
    
    wp config set WP_REDIS_HOST redis --add --allow-root
    wp config set WP_REDIS_PORT 6379 --add --allow-root  
    wp config set WP_CACHE true --add --allow-root  
    wp plugin install redis-cache --activate --allow-root  
    wp plugin update --all --allow-root  
    wp redis enable --allow-root  
    echo "END" 
fi

/usr/sbin/php-fpm7.4 -F