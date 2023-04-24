
all:
	@sudo mkdir -p /home/tliot/data/db /home/tliot/data/wordpress /home/tliot/data/minecraft-server /home/tliot/data/portainer
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo mkdir -p /home/tliot/data/db /home/tliot/data/wordpress /home/tliot/data/minecraft-server /home/tliot/data/portainer
	@sudo ./init_domain.sh
	
restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)
	@sudo rm -rf /home/tliot

.PHONY: all clean fclean re
