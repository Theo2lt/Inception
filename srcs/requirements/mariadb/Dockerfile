# SPECIFIES DISTRIBUTION
FROM debian:buster

# UPDATE AND INSTALLATION
RUN apt-get update
RUN apt install -y mariadb-server 

# COPY THE CONF FOR THE BIND AND THE SQL SCRIPT FOR THE PRIVILEGE
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# COPY THE SCRIPT IN THE IMAGES AND MODIFY THE EXECUTION RIGHTS OF IT
COPY ./tools/script.sh /
RUN  chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]