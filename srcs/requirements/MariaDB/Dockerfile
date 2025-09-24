FROM	alpine:3.22

EXPOSE	3306

RUN		apk update && apk upgrade && apk add --no-cache \
			mariadb

# ---- MariaDB Configuration ---- #
# =============================== #

# Copy custom MariaDB configuration file
COPY	my.cnf /etc/my.cnf

# ---- Prepare MariaDB Runtime Directory ---- #
# =========================================== #

# Create the directory for MariaDB runtime files and set correct ownership
RUN		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# ---- Entrypoint Script ---- #
# =========================== #

# Copy and make the auto-configuration script executable
COPY		entrypoint.sh /entrypoint.sh

ENTRYPOINT	[ "sh", "/entrypoint.sh" ]
