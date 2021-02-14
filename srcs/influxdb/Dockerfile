FROM alpine

RUN apk upgrade; \
	apk add --no-cache tzdata bash ca-certificates openssl && \
    update-ca-certificates
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf

COPY srcs/influxdb-1.8.3-static_linux_amd64.tar.gz /tmp/influxdb.tar.gz
RUN mkdir -p /usr/src; \
    tar -xzf /tmp/influxdb.tar.gz -C /usr/src/; \
    rm /tmp/influxdb.tar.gz; \
    chown -R nobody:nobody /usr/src/influxdb-*; \
    cp -a /usr/src/influxdb-*/* /usr/bin/

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout /etc/ssl/private/influxdb_private.key \
		-out /etc/ssl/certs/influxdb_public.crt \
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/influxdb.conf /etc/influxdb/
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

EXPOSE 8086

CMD /tmp/setup.sh