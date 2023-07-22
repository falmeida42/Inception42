DCOMPOSE_FILE=./srcs/docker-compose.yml
ENV_FILE=./srcs/.env
WORDPRESS_VOLUME_DIR=/home/falmeida/data/wordpress
MARIADB_VOLUME_DIR=/home/falmeida/data/mariadb

all:	persistent_storage
	@docker compose -f $(DCOMPOSE_FILE) --env-file $(ENV_FILE) up -d

clean:
	@docker compose -f $(DCOMPOSE_FILE) --env-file $(ENV_FILE) down

fclean: clean
	@sudo rm -rf $(MARIADB_VOLUME_DIR)
	@sudo rm -rf $(WORDPRESS_VOLUME_DIR)
	@docker image prune -a -f
	@docker system prune -a

re: fclean all

persistent_storage:
	@sudo mkdir -pv $(MARIADB_VOLUME_DIR)
	@sudo mkdir -pv $(WORDPRESS_VOLUME_DIR)

.PHONY: all fclean clean persistent_storage