#!/bin/sh
FILE=wordpress
cd /var/www/html

if [ -d "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE not exists."
    wget https://wordpress.org/latest.zip;
    unzip latest.zip
    rm -rf latest.zip
    cd $FILE
    mv /home/wp-config.php .

    sed -i -e "s/BDD_NAME/$BDD_WORDPRESS_NAME/g" wp-config.php
    sed -i -e "s/BDD_USER/$BDD_WORDPRESS_USER/g" wp-config.php
    sed -i -e "s/BDD_PASSWORD/$BDD_WORDPRESS_USER_PASSWORD/g" wp-config.php
    sed -i -e "s/BDD_HOST/$HOST/g" wp-config.php
fi

/usr/sbin/php-fpm7.3 -F