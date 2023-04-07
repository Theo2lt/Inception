# SPECIFIE LA DISTRIBUTION
FROM debian:latest

# MISE A JOUR ET INSTALLATION
RUN apt update
RUN apt install -y adminer 

# EXPOSE LE PORT 
EXPOSE 80

RUN echo 'ServerName 127.0.0.2' >> /etc/apache2/apache2.conf

RUN service apache2 start && a2enconf adminer.conf 
RUN service apache2 restart


#CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#ENTRYPOINT ["adminer"]
##ENTRYPOINT ["service","apache2","restart"]
