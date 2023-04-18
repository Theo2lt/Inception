NAME = wordpress

all:
	sh install_resource.sh
	sudo mkdir -p /home/tliot/data/db 
	sudo mkdir -p /home/tliot/data/wordpress
	sudo mkdir -p /home/tliot/data/minecraft-server
	docker-compose -f ./srcs/docker-compose.yml up --build -d

re :
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down


clean:
	docker rm -f $$(docker ps -qa)
	docker volume rm -f $$(docker volume ls)
	sudo rm -rf /home/tliot


.PHONY: all clean fclean re
