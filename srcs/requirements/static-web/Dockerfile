# SPECIFIE LA DISTRIBUTION
FROM debian:buster

# UDPATE & INSTALLATION
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y npm 

# FOR DEBUGIN
RUN apt install -y iputils-ping vim 

COPY ./conf/ /home/

COPY ./tools/script.sh /bin/
RUN chmod 777 /bin/script.sh

ENTRYPOINT ["/bin/script.sh"]
