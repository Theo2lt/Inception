# SPECIFIE LA DISTRIBUTION
FROM debian:10

# MISE A JOUR ET INSTALLATION
RUN apt update
RUN apt install -y adminer 

RUN apt install iputils-ping -y
RUN apt install vim -y

# EXPOSE LE PORT 
EXPOSE 80

RUN echo 'ServerName 127.0.0.2' >> /etc/apache2/apache2.conf

RUN service apache2 start && a2enconf adminer.conf 


CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
