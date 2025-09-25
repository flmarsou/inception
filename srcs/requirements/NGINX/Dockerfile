FROM	alpine:3.22

RUN		apk update && apk upgrade && apk add --no-cache \
			nginx \
			openssl

RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42Nice/CN=flmarsou.42.fr/UID=flmarsou"

RUN		mkdir -p /var/run/nginx

COPY	nginx.conf /etc/nginx/nginx.conf

RUN		adduser -S www-data -G www-data
RUN		mkdir -p /var/www/wordpress
RUN		chmod 755 /var/www/wordpress
RUN		chown -R www-data:www-data /var/www/wordpress

CMD		["nginx", "-g", "daemon off;"]
