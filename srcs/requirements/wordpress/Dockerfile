# SPECIFIE LA DISTRIBUTION
FROM debian:11
RUN apt-get update

# UDPATE & INSTALLATION
RUN apt install unzip php curl wget redis php-redis php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt install default-mysql-client -y
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y


# FOR WORDPRESS
COPY ./conf/install.sh /home/
COPY ./conf/wp-config.php /home/
RUN chmod 777 /home/install.sh

EXPOSE 9000

ENTRYPOINT ["/home/install.sh" ] 
