FROM debian:latest

RUN apt update
RUN apt install -y adminer 
RUN echo 'ServerName 127.0.0.1' >> /etc/apache2/apache2.conf
RUN service apache2 start 
RUN a2enconf adminer.conf

# EXPOSE LE PORT 
EXPOSE 80

#ENTRYPOINT ["adminer"]
##ENTRYPOINT ["service","apache2","restart"]
