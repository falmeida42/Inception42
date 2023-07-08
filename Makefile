VOLUME_DIRS := ~/data/mariadb ~/data/wordpress

all: up

up: $(VOLUME_DIRS)
	@docker compose -f srcs/docker-compose.yml up -d --build --force-recreate

down:
	@docker compose -f srcs/docker-compose.yml down

$(VOLUME_DIRS):
	@sudo mkdir -p ~/data/mariadb
	@sudo mkdir -p ~/data/wordpress

clean_containers: down
	@docker container prune

clean_images: down
	@docker image prune -a -f

clean_volumes: down
	@docker volume rm mariadb wordpress
	@sudo rm -rf $(VOLUME_DIRS)

clean_networks:
	@docker network prune

clean: down clean_containers

fclean: clean clean_volumes
	@docker system prune -a --volumes

re: fclean up

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean re