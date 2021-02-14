cp -r /usr/src/wordpress/wp-content /var/www/
chown -R nobody:nobody /var/www

DBNAME=wordpress
USER=syudai
PASS=password

cat > /tmp/sql << EOF
CREATE DATABASE IF NOT EXISTS $DBNAME;
CREATE USER '$USER'@'172.17.0.%' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $DBNAME.* TO '$USER'@'172.17.0.%' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO '$USER'@'172.17.0.%' IDENTIFIED BY '$PASS' ;
EOF
mysql --host=mysql-service --user=root --password=password < /tmp/sql
rm /tmp/sql

wp core install \
	--url="https://192.168.49.10:5050" \
	--title=Example \
	--admin_user=admin \
	--admin_password=password \
	--admin_email=info@example.com \
	--skip-email \
	--path=/usr/src/wordpress
wp user create \
	editor editor@example.com \
	--user_pass=password \
	--role=editor \
	--path=/usr/src/wordpress
wp user create \
	author author@example.com \
	--user_pass=password \
	--role=author \
	--path=/usr/src/wordpress
wp user create \
	contributor contributor@example.com \
	--user_pass=password \
	--role=contributor \
	--path=/usr/src/wordpress
wp user create \
	subscriber subscriber@example.com \
	--user_pass=password \
	--role=subscriber \
	--path=/usr/src/wordpress

telegraf &
/usr/sbin/php-fpm7
nginx -g "daemon off;"