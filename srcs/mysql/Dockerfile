FROM alpine

RUN	apk upgrade; \
	apk add --no-cache \
			mysql \
			mysql-client
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/my.cnf /etc/
COPY srcs/create_tables.sql /tmp/
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

EXPOSE 3306

CMD /tmp/setup.sh