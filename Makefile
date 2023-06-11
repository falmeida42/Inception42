all:
	sudo mkdir -p /home/falmeida/data/wordpress
	sudo mkdir -p /home/falmeida/data/database
	sudo chmod 777 /etc/hosts
	sudo docker-compose -f docker-compose.yml up --build -d

up:
	sudo docker-compose -f docker-compose.yml up --build -d

fclean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm inception-network;\


.PHONY: all up fclean
