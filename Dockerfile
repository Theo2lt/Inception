FROM debian:latest
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install systemctl -y
#RUN systemctl status nginx

#COPY ./srcs/NGINX/nginx.conf /etc/nginx/conf.d
#EXPOSE	80
RUN mkdir /etc/nginx/ssl
CMD ["nginx", "-g", "daemon off"]
#CMD [ "cat", "/etc/nginx/sites-enabled/default" ]