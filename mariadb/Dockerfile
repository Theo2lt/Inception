# SPECIFIE LA DISTRIBUTION
FROM debian:latest

# MISE A JOUR ET INSTALLATION
RUN apt update
RUN apt install -y mariadb-server 

# EXPOSE LE PORT 
EXPOSE 3306

# COPY LA CONF POUR LE BIND ET LE SCRIPT SQL POUR LES DROITS DE PRIVILEGES
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/script.sql /home/script.sql

# DEMARE MARIADB ET APPLIQUE LES DROITS DE PRIVILEGES
RUN service mariadb start && mariadb  < /home/script.sql && rm -f /home/script.sql;


ENTRYPOINT ["mysqld"]

