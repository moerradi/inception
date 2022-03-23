chown -R $FTP_USER:$FTP_USER /var/wordpress
chown -R $FTP_USER:$FTP_USER /var/run/chroot-secured
/usr/sbin/vsftpd /etc/vsftpd.conf