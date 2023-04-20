FROM debian:11

RUN apt update

RUN apt install iputils-ping -y
RUN apt install vim -y

RUN apt install -y openjdk-17-jdk openjdk-17-jre -y

WORKDIR /server
EXPOSE 25565
COPY config/server.jar /usr/bin/
COPY config/eula.txt .
ENTRYPOINT ["java", "-Xms1024m", "-Xmx2560m","-jar","/usr/bin/server.jar","nogui;"]

