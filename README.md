# Inception
-----------------------

LANCEMENT DOCKER : 
         -d : mode detachable (background)
    -- name : definir le nom du DOCKER

Image : 
<url_register>/<nom de l'image>:<tag>

-----------------------

docker run -d --name c1 nginx:latest : lancement de nginx
docker ps : list docker 
docker stop <id>/<name> : stop 
docker rm -f <id>/<name> : suprimer le docker (-f pour forcer la suppression d'un docker actif)

-----------------------

DOCKER RUN : 
    . -ti : lancer un terminal sur le process
    . -p  : exposition de port 
    . --rm : suppression du conteneur sur sortie
    . --hostname : specifie le nouveau nom de l'hostname 
    . -- dns : specifie le dns de la machine
docker run -ti --name c1 nginx:latest : terminal accessible mais bloqué
docker run -ti --name c1 debian : terminal accessible non bloqué
docker run -ti --name c1 debian : terminal accessible non bloqué et suppression à la fin de l'utilisation 

-----------------------

SUPRIMER DOCKERS :
docker rm -f $(docker ps -qa) : suppression de tout les dockers

-----------------------

#### LES VOLUMES ####

-----------------------

intéret : 
    - Facile pour persister de la donnée.
    - Pratique pour faire des backups
    - Partager entre de multiple conteneur
    - Multiconteneur & permissions
    - locals ou distants

commmande de base : 
docker volume 
        - ls             : lister les volumes 
        - create <name>  : creation d'un nouveau volume
        - rm <name>      : suppression du volume
        - inspect <name> : inspection du volume

paramètre docker run : -v vol:/var/data/

-----------------------

1 : docker run -d --name c1 -v vol:/usr/share/nginx/html/ -p 80:80 nginx:latest : lancement et montage du volume 

docker exec -ti c1 bash : pour se connecter dans un conteneur avec bash (ou pour lance un autre executable)

Creer un docker qui se detruit la fin de son utilisation:
2 : docker run -ti --name c2 --rm -v vol:/usr/share/nginx/html/ debian:latest


-----------------------

### Les differents type de volumes ### 

1. Bind Mount 
2. Volumes Docker 
3. TMPFS

Distinction CLI
. -v ou --volume 
    si nom de volume = volume
    si path = bind 

. --mount + type
    type = bind / volume / tmpfs 


1. Bind Mount
sudo mkdir /data
docker run -d --name c1 --mount type=bind,source=/data/,target=/usr/share/nginx/html -p 80:80 nginx:latest
Option : ,readonly / ,readwrite
docker exec -ti c1 bash

2. Volumes Docker
docker volume create mynginx
docker run -d --name c2 --mount type=volume,src=mynginx,destination=/usr/share/nginx/html -p 81:80 nginx:latest 

3. Tmpfs
docker run -d --name c3 --mount type=tmpfs,destination=/usr/share/nginx/html -p 82:80 nginx:latest 

-----------------------

### USERID pour les volumes ### 

Creation user 
- useradd -u 1111 theo1
- useradd -u 1112 theo2

Creer un repertoire "test" dans le quel on va mettre un Dockerfile

---
FROM debian:latest
RUN useradd -u 1111 theo1
RUN useradd -u 1113 theo3
---
docker build -t myimage:v1.0 .

docker images : pour lister les images en local.


sudo mkdir /myvolume

docker run -d --name c1 -v /myvolume/:/data/ myimage:v1.0
(pas dans cette image de process infinie)

docker rm -f c1

docker run -d --name c1 -v /myvolume/:/data/ myimage:v1.0 sleep infinity
(pour avoir cette fois si le docker avec un process en arriere plan)

docker exec -ti c1 bash
touch /data/titi

maintenant aller voir dans l'host le volume /myvolume 
ls -la /myvolume 

total 8
drwxr-xr-x  2 root root 4096 Mar 14 15:53 .
drwxr-xr-x 21 root root 4096 Mar 14 15:47 ..
-rw-r--r--  1 root root    0 Mar 14 15:53 titi

docker rm -f c1


docker run -d --name c1 -v /myvolume/:/data/ -u theo1 myimage:v1.0 sleep infinity

touch /data/toto -> touch: cannot touch '/data/toto': Permission denied



-----------------------
### Container Runtimes hauts & bas niveaux ###

"OCI" --- "Container Runtime" --- "Linux"

OCI = Open Container Initiative
Standars qui a pour vocation de definir des normes d'images Container
Layers + manifest + config 



-----------------------

### Variable d'environnement (env,enfile...) ###

sudo docker run -tid --name testenv --env MYVAR="123" debian:latest

docker exec -ti testenv bash
Aller regarder dans le container les variables d'environnement avec la cmd "env".

---
root@cb9e44034297:/# env
HOSTNAME=cb9e44034297
MYVAR=123
PWD=/
HOME=/root
TERM=xterm
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
---

Cette methode fonctionne mais n'est pas securisée par exemple pour les passwords.

Pour se fair, on vas creer un fichier "var_mdp.lst"
dans le quel nous mettron nos variables d'ENV.

---
MYPASSWORD="safepassword"
MYUSER="secretuser"
MYDB="BDDofficial"
---

sudo docker run -tid --name testenv --env-file var_mdp.lst debian:latest
docker exec -ti testenv bash
Aller regarder dans le container les variables d'environnement avec la cmd "env".

---
HOSTNAME=553c2ac8a657
PWD=/
HOME=/root
MYPASSWORD="safepassword"
TERM=xterm
SHLVL=1
MYUSER="secretuser"
MYDB="BDDofficial"
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
---

-----------------------

### DOCKERFILE créer une image ###

dockerfile est une fichier de configuration dans le but de créer une image 

List d'instruction principal
    - RUN : lancement de commmande (apt ...)
    - ENV : variable d'environnement
    - EXPOSE : exposition de ports
    - VOLUMES : définit les volumes 
    - COPY : copy entre host et conteneur
    - ENTRYPOINT : processus maitre

Intérêts de dockerfile
    - relancer une création d'inage à tout moment
    - meilleure visibilité sur la configuration
    - script edition de docker file 
    - création d'image de prod ou dev
