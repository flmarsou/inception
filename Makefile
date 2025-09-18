COMPOSE_FILE	:= ./srcs/docker-compose.yml
PROJECT_NAME	:= inception

up:
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} up -d --build

down:
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} down || true

restart: down up
