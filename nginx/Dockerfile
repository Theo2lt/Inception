FROM debian:latest
RUN apt-get update
RUN apt-get install -y nginx 
VOLUME /var/www/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
