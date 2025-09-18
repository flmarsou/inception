FROM	alpine:3.22

RUN		apk update && apk upgrade && apk add --no-cache \
			wget \
			php84 \
			php84-fpm \
			php84-mysqli \
			php84-phar \
			mariadb-client

RUN		mkdir -p /var/www && chown -R root:root /var/www
RUN		wget https://wordpress.org/wordpress-6.8.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.8.tar.gz && rm wordpress-6.8.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY	www.conf /etc/php84/php-fpm.d/www.conf

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	auto_config.sh /auto_config.sh
RUN		chmod +x /auto_config.sh

ENTRYPOINT [ "sh", "/auto_config.sh" ]
