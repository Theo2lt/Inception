FROM debian:latest
RUN apt update
RUN apt install openjdk-17-jdk -y
RUN apt install openjdk-17-jre -y
WORKDIR /minecraft-server
ENTRYPOINT ["java", "-Xms1024m", "-Xmx2560m","-jar","server.jar","nogui;"]
