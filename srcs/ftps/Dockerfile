FROM alpine

RUN apk upgrade; \
	apk add --no-cache \
		vsftpd openssl
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout /etc/ssl/private/ftps_private.key \
		-out /etc/ssl/certs/ftps_public.crt \
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/vsftpd.conf /etc/vsftpd/
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN chmod 644 /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21002

CMD /tmp/setup.sh