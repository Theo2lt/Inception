# SPECIFIE LA DISTRIBUTION
FROM debian:buster

# MISE A JOUR ET INSTALLATION
RUN apt-get update && apt-get upgrade -y 
RUN apt install -y iputils-ping vim adminer 


# EXPOSE LE PORT 

RUN echo 'ServerName adminer' >> /etc/apache2/apache2.conf
COPY conf/000-default.conf /etc/apache2/sites-available/
RUN service apache2 start && a2enconf adminer.conf 


CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
