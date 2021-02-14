FROM alpine

RUN apk upgrade; \
	apk add --no-cache \
		openssl
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY srcs/glibc-2.32-r0.apk /tmp/
RUN apk -U upgrade && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	apk add --no-cache /tmp/glibc-2.32-r0.apk && \
	rm /tmp/*

COPY srcs/grafana-7.3.6.linux-amd64.tar.gz /tmp/
RUN mkdir /usr/share/grafana && \
	tar -xzf /tmp/grafana-7.3.6.linux-amd64.tar.gz --strip-components=1 -C /usr/share/grafana && \
	rm /tmp/*

RUN openssl req -x509 -nodes -days 3650 -newkey rsa:4096 \
		-keyout /etc/ssl/private/grafana_private.key \
		-out /etc/ssl/certs/grafana_public.crt \
		-subj "/C=JP/ST=Tokyo/L=Minato/O=42/OU=42tokyo/CN=syudai"

COPY srcs/telegraf.conf /etc/telegraf/
COPY srcs/custom.ini /usr/share/grafana/conf
COPY srcs/dashboards/*.json /var/lib/grafana/dashboards/
COPY srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

EXPOSE 3000

CMD /tmp/setup.sh