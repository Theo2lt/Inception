# SPECIFIE LA DISTRIBUTION
FROM debian:10

# MISE A JOUR ET INSTALLATION
RUN apt update && apt install -y mariadb-server


RUN apt install iputils-ping -y
RUN apt install vim -y
# EXPOSE LE PORT 
EXPOSE 3306

# COPY LA CONF POUR LE BIND ET LE SCRIPT SQL POUR LES DROITS DE PRIVILEGES
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /
# DEMARE MARIADB ET APPLIQUE LES DROITS DE PRIVILEGES

RUN chmod +x /script.sh
#ENTRYPOINT [ "/home/script.sh", ]
CMD [ "/script.sh" ]
