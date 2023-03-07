FROM debian
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wordpress -y
RUN apt-get install php libapache2-mod-php php-mysql -y
#EXPOSE 80 443
CMD ["bash", "-g", "daemon off;"]