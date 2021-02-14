FROM alpine

RUN apk upgrade; \
	apk add --no-cache \
			nginx \
			openssl \
			openssh
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /var/run/nginx

COPY srcs/sshd_config /etc/ssh/
COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/index.html /var/www/index.html
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN chmod 644 /var/www/index.html

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx_private.key \
		-out /etc/ssl/certs/nginx_public.crt \
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

RUN ssh-keygen -A

EXPOSE 80 443 22

CMD /tmp/setup.sh