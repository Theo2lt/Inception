# SPECIFIE LA DISTRIBUTION
FROM debian:11
RUN apt-get update && apt-get upgrade

# UDPATE & INSTALLATION
RUN apt-get install -y vsftpd


# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/script.sh /home/
RUN chmod +x /home/script.sh



ENTRYPOINT ["/home/script.sh" ] 
