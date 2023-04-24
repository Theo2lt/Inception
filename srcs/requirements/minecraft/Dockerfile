FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt install -y vim iputils-ping wget curl tar
RUN apt install -y openjdk-11-jdk openjdk-11-jre 

WORKDIR /server

COPY config/server.jar /usr/bin/server.jar
COPY config/eula.txt .
ENTRYPOINT ["java", "-Xms1024m", "-Xmx2560m","-jar","/usr/bin/server.jar","nogui;"]

