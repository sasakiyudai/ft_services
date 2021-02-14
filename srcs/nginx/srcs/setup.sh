adduser -D "syudai"
echo "syudai:password" | chpasswd
/usr/sbin/sshd

telegraf &
/usr/sbin/php-fpm7
nginx -g "daemon off;"