FROM alpine

RUN apk upgrade; \
	apk add --no-cache \
		curl bash openssl gnupg nginx php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-session php7-mbstring 
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /run/nginx

COPY srcs/phpMyAdmin-5.0.4-all-languages.tar.gz phpMyAdmin.tar.gz
RUN mkdir -p /var/www/html/tmp; \
    chown nobody:nobody /var/www/html/tmp; \
	tar -xzf phpMyAdmin.tar.gz -C /var/www/html --strip-components=1; \
	sed -i "s@define('CONFIG_DIR'.*@define('CONFIG_DIR', '/etc/phpmyadmin/');@" /var/www/html/libraries/vendor_config.php

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx_private.key \
		-out /etc/ssl/certs/nginx_public.crt \
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/config.inc.php /etc/phpmyadmin/config.inc.php
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN chmod 644 /etc/phpmyadmin/config.inc.php

EXPOSE 5000

CMD /tmp/setup.sh