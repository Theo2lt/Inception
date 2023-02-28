FROM debian:latest
RUN apt-get update
RUN apt-get upgrade
RUN apt-install 
RUN sudo apt install nginx
EXPOSE 80