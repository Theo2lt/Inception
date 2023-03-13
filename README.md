# Inception
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

1 : docker run -d --name c1 -v vol:/usr/share/nginx/html/ nginx:latest : lancement et montage du volume 

docker exec -ti c1 bash : pour se connecter dans un conteneur avec bash (ou pour lance un autre executable)

Creer un docker qui se detruit la fin de son utilisation:
2 : docker run -ti --name c2 --rm -v vol:/usr/share/nginx/html/ debian:latest


-----------------------