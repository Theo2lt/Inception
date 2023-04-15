# SPECIFIE LA DISTRIBUTION
FROM debian:latest
RUN apt-get update

# UDPATE & INSTALLATION
RUN apt install php curl wget redis php-redis php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
