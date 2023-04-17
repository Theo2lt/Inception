NAME = wordpress

all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

re :
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down


clean:
	docker rm -f $$(docker ps -qa);\
	docker volume rm -f $$(docker volume ls);\
	


.PHONY: all clean fclean re
