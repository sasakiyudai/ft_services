telegraf &
influxd run -config /etc/influxdb/influxdb.conf
sleep 10
influx -execute -host 127.0.0.1 -port 8086 "CREATE DATABASE grafana"
influx -execute "CREATE USER syudai WITH PASSWORD 'password'"
influx -execute "GRANT ALL ON grafana TO syudai"

#tail -f /dev/null