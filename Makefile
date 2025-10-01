COMPOSE_FILE	:= ./srcs/docker-compose.yml
PROJECT_NAME	:= inception

up:
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} up -d --build

down:
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} down -v || true

# ---- Debug MariaDB ---- #
# ======================= #

mariadb_build:
		docker build -t mariadb_debug ./srcs/requirements/MariaDB/

mariadb_run:
		docker run -it mariadb_debug

mariadb_stop:
		docker stop mariadb_debug || true
		docker rm mariadb_debug || true

# ---- Debug WordPress ---- #
# ========================= #

wordpress_build:
		docker build -t wordpress_debug ./srcs/requirements/WordPress/

wordpress_run:
		docker run -it wordpress_debug

wordpress_stop:
		docker stop wordpress_debug || true
		docker rm wordpress_debug || true
