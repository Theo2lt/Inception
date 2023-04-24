# SPECIFIE LA DISTRIBUTION
FROM debian:buster

# MISE A JOUR ET INSTALLATION
RUN apt-get update && apt-get upgrade -y 
RUN apt install -y mariadb-server iputils-ping vim

# COPY LA CONF POUR LE BIND ET LE SCRIPT SQL POUR LES DROITS DE PRIVILEGES
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /
# DEMARE MARIADB ET APPLIQUE LES DROITS DE PRIVILEGES

RUN chmod +x /script.sh
#ENTRYPOINT [ "/home/script.sh", ]
CMD [ "/script.sh" ]
