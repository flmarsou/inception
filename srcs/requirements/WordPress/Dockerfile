FROM	alpine:3.22

RUN		apk update && apk upgrade && apk add --no-cache \
			wget \
			php84 \
			php84-fpm \
			php84-mysqli \
			php84-phar \
			mariadb-client

RUN		ln -s /usr/bin/php84 /usr/bin/php

# ---- User/Group Setup ---- #
# ========================== #

# Create www-data group and user if they don't exist (ignore errors if already present)
# -g: group
# -u: user
# -S: System
# -D: Default
# -G: Group
RUN		addgroup -g 82 -S www-data || true
RUN		adduser -u 82 -D -S -G www-data www-data || true

# ---- WordPress Download and Setup ---- #
# ====================================== #

RUN		mkdir -p /var/www && chown -R root:root /var/www
RUN		wget https://wordpress.org/wordpress-6.8.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.8.tar.gz && rm wordpress-6.8.tar.gz
RUN		chown -R root:root /var/www/wordpress

# ---- PHP-FPM Configuration ---- #
# =============================== #

# Copy custom PHP-FPM pool configuration
COPY	www.conf /etc/php84/php-fpm.d/www.conf

# ---- WP-CLI Setup ---- #
# ====================== #

# Download, make executable, and move wp-cli to PATH
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

# ---- Entrypoint Script ---- #
# =========================== #

# Copy and make the auto-configuration script executable
COPY	auto_config.sh /auto_config.sh
RUN		chmod +x /auto_config.sh

ENTRYPOINT [ "sh", "/auto_config.sh" ]
