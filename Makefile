COMPOSE_FILE	:= ./srcs/docker-compose.yml
PROJECT_NAME	:= inception

# ---- Docker Compose ---- #
# ======================== #

up:
		mkdir -p /home/${shell whoami}/data/db_data
		mkdir -p /home/${shell whoami}/data/wp_data
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} up -d --build

down:
		docker-compose -f ${COMPOSE_FILE} -p ${PROJECT_NAME} down -v || true

re: down up

# ---- Debug MariaDB ---- #
# ======================= #

mariadb_build:
		docker build -t mariadb_debug ./srcs/requirements/MariaDB/

mariadb_run:
		docker run -it mariadb_debug

mariadb_stop:
		docker stop mariadb_debug || true
		docker rm mariadb_debug || true

mariadb_enter:
		docker exec -it mariadb mysql -u root -p

# ---- Debug WordPress ---- #
# ========================= #

wordpress_build:
		docker build -t wordpress_debug ./srcs/requirements/WordPress/

wordpress_run:
		docker run -it wordpress_debug

wordpress_stop:
		docker stop wordpress_debug || true
		docker rm wordpress_debug || true

# ---- Debug NGINX ---- #
# ===================== #

nginx_build:
		docker build -t nginx_debug ./srcs/requirements/NGINX/

nginx_run:
		docker run -it nginx_debug

nginx_stop:
		docker stop nginx_debug || true
		docker rm nginx_debug || true
