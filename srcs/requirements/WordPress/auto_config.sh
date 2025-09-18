#!/bin/sh

sleep 1

echo "[ INFO ] Starting WordPress..."

if [ ! -f "/wp-config.php" ]; then
	wp config create \
		--allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

echo "[ INFO ] Running "
exec php-fpm84 -F
