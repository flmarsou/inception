FROM	alpine:3.22

EXPOSE	3306

RUN		apk update && apk upgrade && apk add --no-cache \
			mariadb

COPY	my.cnf /etc/my.cnf

RUN		mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY		entrypoint.sh /entrypoint.sh
ENTRYPOINT	[ "sh", "/entrypoint.sh" ]
