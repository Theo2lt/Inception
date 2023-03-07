FROM debian
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN mkdir /etc/nginx/ssl
#EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
