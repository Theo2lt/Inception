# SPECIFIES DISTRIBUTION
FROM debian:buster

# UPDATE AND INSTALLATION
RUN apt-get update 
RUN apt install -y adminer 

# COPY THE CONF FILE 
COPY 000-default.conf /etc/apache2/sites-available/
RUN echo 'ServerName adminer' >> /etc/apache2/apache2.conf

# START AND CONF 
RUN service apache2 start && a2enconf adminer.conf 

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]