# Inception

This project aims to deepen the knowledge of system administration.

Use of dockerfile for the creation and management of custom images, micro services.

Use of docker-compose for the deployment of containers, the creation and management of the network, storage space, etc ...

## Structure of the project with the bonuses

<img src="./.img_readme/DGR3.png">

## DOCKER

## BASIC DOCKER COMMANDS

* ```docker ps -a``` : List active containers (-a is for showing all containers, running and stopped)
* ```docker stop  <id>/<name>``` : Stop running containers
* ```docker start <id>/<name>``` : Start stopped containers
* ```docker rm -f <id>/<name>``` : Remove containers (-f is for force the removal of a running container)
* ```docker exec -it <name> bash :``` Execute a command in a running container


Tips to delete all containers, use: ```docker rm -f $(docker ps -qa)```

## DOCKER RUN

``` bash
$ docker run [OPTIONS] IMAGE[:TAG]
```

| Parameters | Description                       |
| :-------- | :-------------------------------- |
| `-d`      | Run container in background (daemon mode) |
| `-it`      | creating an interactive container |
| `-p`      | Publish a container port(s) to the host |
| `--rm`      | Automatically remove the container when it exits |
| `--hostname`      | Container host name |
| `--name`      |  Assign a name to the container |

#### Exemple 
```
$ docker run -d -ti -p 80:80 --rm --name web-ngnix --hostname nginx-container nginx:latest
```
use ```docker ps``` to list running containers
``` bash
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                               NAMES
86335dfeaa0b   nginx:latest   "/docker-entrypoint.…"   7 seconds ago   Up 6 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   web-ngnix
```

We can see that the container is running in daemon mode.
That the exposure of the ports is well done and that the name of the container is the one that we specified in parameter

``` bash
docker exec -it web-ngnix bash
```
The docker exec command runs a new command in a running container.

``` bash
root@nginx-container:/# 
```

We can now see that the name specified in ```--hostname``` is applied


## DOCKER VOLUMES 

#### The advantages of volumes : 
* Easy to persist data.
* Convenient for making backups
* Share data between multiple containers
* Multi-containers and permissions


#### Basic command for managed volumes :
* ```docker volume ls``` : list volumes 
* ```docker volume create <name>``` : creating a new volume
* ```docker volume rm <name>``` : delete a volume
* ```docker volume inspect <name>``` : inspection of a volume

#### The different types of volumes :
* Bind Mount : ```Bind mounts are dependent on the directory structure and OS of the host machine```
* Volumes Docker : ```volumes are completely managed by Docker```
* TMPFS : ```As opposed to volumes and bind mounts, a tmpfs mount is temporary, and only persisted in the host memory. When the container stops, the tmpfs mount is removed, and files written there won’t be persisted.```

## DOCKER RUN WITH VOLUMES

#### 1. Bind Mount  :

```sudo mkdir /data``` (creation of mount folder is necessary otherwise error will appear when using docker run)

```docker run -d --name TestBindMount --mount type=bind,source=/data/,target=/usr/share/nginx/html -p 80:80 nginx:latest```

```docker exec -ti TestBindMount bash```

#### 2. Volumes Docker :

```docker volume create mynginx``` (optional because if the volume is not created, docker will do it)

```docker run -d --name TestVolume --mount type=volume,src=mynginx,destination=/usr/share/nginx/html -p 81:80 nginx:latest```

```docker exec -ti TestVolume bash```

#### 3. Tmpfs:

```docker run -d --name TestTmpfs --mount type=tmpfs,destination=/usr/share/nginx/html -p 82:80 nginx:latest```

```docker exec -ti TestTmpfs bash```

#### To check data persistence you can delete all containers and recreate them !! (do not recreate the volumes)

``` bash
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                               NAMES
f0096643b045   nginx:latest   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:82->80/tcp, :::82->80/tcp   TestTmpfs
92260c1f5880   nginx:latest   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:81->80/tcp, :::81->80/tcp   TestVolume
dcad272f7531   nginx:latest   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:80->80/tcp, :::80->80/tcp   TestBindMount
```

In each container modify/create the /usr/share/nginx/html/index.html, Remove containers and recreate.
Now check if the changes have been saved.
 
If you are running docker on your OS.
You can admire the changes from your websites.

* TestBindMount : http://localhost:80
* TestVolume : http://localhost:81
* TestTmpfs : http://localhost:82

