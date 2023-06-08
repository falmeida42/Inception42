all:
	sudo mkdir -p /home/falmeida/data/wordpress
	sudo mkdir -p /home/falmeida/data/database
	sudo chmod 777 /etc/hosts
	sudo docker-compose -f docker-compose.yml up --build -d

up:
	sudo docker-compose -f docker-compose.yml up --build -d

fclean:
	sudo docker-compose -f docker-compose.yml down --rmi all -\
	-volumes
		sudo docker rmi debian:buster
		sudo rm -rf /home/falmeida/data

.PHONY: all up fclean
