FROM debian:buster

RUN apt update

RUN apt install -y vim iputils-ping

RUN apt install -y redis
COPY /conf/redis.conf /etc/redis/

CMD ["redis-server",  "--protected-mode", "no"]

