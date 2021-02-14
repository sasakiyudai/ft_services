telegraf &

mkdir -p /var/ftps
adduser -D --home /var/ftps/"syudai" "syudai"
chmod a+w /var/ftps/"syudai"

echo "syudai:password" | chpasswd
echo "syudai" > /etc/vsftpd.chroot_list

/usr/sbin/vsftpd \
	-opasv_min_port=21000 \
	-opasv_max_port=21002 \
	-opasv_address=192.168.49.10 \
	/etc/vsftpd/vsftpd.conf