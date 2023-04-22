# SPECIFIE LA DISTRIBUTION
FROM debian:10

# UDPATE & INSTALLATION
RUN apt-get update
RUN apt-get install -y npm 

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y

COPY ./conf/web/ /home/
COPY ./tools/script.sh /bin/
RUN chmod 777 /bin/script.sh

EXPOSE 80

ENTRYPOINT ["/bin/script.sh"]
