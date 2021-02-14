FROM alpine

RUN apk upgrade && \
	apk add --no-cache \
		curl nginx openssl mysql-client php7 php7-fpm php7-curl php7-dom php7-exif php7-fileinfo php7-json php7-mbstring php7-mysqli php7-sodium php7-openssl php7-imagick php7-xml php7-zip php7-gd php7-iconv php7-mcrypt php7-simplexml php7-xmlreader php7-xmlwriter php7-zlib php7-phar php7-intl php7-ctype php7-opcache
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /run/nginx

COPY srcs/wordpress-5.6.tar.gz /tmp/wordpress.tar.gz
RUN mkdir -p /usr/src; \
	tar -xzf /tmp/wordpress.tar.gz -C /usr/src/; \
	rm /tmp/wordpress.tar.gz; \
	chown -R nobody:nobody /usr/src/wordpress

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
			-keyout /etc/ssl/private/nginx_private.key \
			-out /etc/ssl/certs/nginx_public.crt \
			-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

COPY srcs/wp-config.php /usr/src/wordpress
RUN chown nobody:nobody /usr/src/wordpress/wp-config.php && \
	chmod 640 /usr/src/wordpress/wp-config.php

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

EXPOSE 5050

CMD /tmp/setup.sh