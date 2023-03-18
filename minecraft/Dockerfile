FROM debian:latest
RUN apt update
RUN apt install openjdk-17-jdk -y
RUN apt install openjdk-17-jre -y
RUN apt install vim
VOLUME /minecraft-server
RUN cd /minecraft-server;
##ENTRYPOINT ["java", "-Xms1024m", "-Xmx2560m","-jar","server.jar","nogui;"]
