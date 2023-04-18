# SPECIFIE LA DISTRIBUTION
FROM debian:10

# UDPATE & INSTALLATION
RUN apt-get update
RUN apt-get install -y nginx 

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y

COPY ./conf/default /etc/nginx/sites-enabled/
COPY ./conf/web1.tliot.42.fr.conf /etc/nginx/sites-available/
# PORT EXPOSE 
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
