# SPECIFIE LA DISTRIBUTION
FROM debian:10

# UDPATE & INSTALLATION
RUN apt-get update
RUN apt-get install -y nginx 

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y

COPY ./conf/default /etc/nginx/sites-enabled/

COPY ./conf/minecraft.conf /etc/nginx/modules-available/
RUN  ln -s /etc/nginx/modules-available/minecraft.conf /etc/nginx/modules-enabled/minecraft.conf
# PORT EXPOSE 
EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
