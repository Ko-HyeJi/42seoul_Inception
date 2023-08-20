VOLUME_PATH = ${HOME}/data
DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	mkdir -p ${VOLUME_PATH}/wordpress
	mkdir -p ${VOLUME_PATH}/database
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d --build --force-recreate

host:
	sudo echo "127.0.0.1 hyko.42.fr" >> /etc/hosts

clean:
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v --rmi all --remove-orphans

fclean: clean
	sudo rm -rf ${VOLUME_PATH}
	sudo docker system prune -af

re:
	$(MAKE) fclean
	$(MAKE) all

ls:
	@echo ==============IMAGES==============
	@docker images
	@echo
	@echo ==============NETWORK==============
	@docker network ls
	@echo
	@echo ==============PS-ALL==============
	@docker ps -a
	@echo

.PHONY: all clean fclean re ls
