FROM debian:buster

#udpate and upgrade
RUN apt-get update && apt-get upgrade -y

#install ftp
RUN apt-get install -y vsftpd
# copy config file
COPY ./vsftpd.conf /etc/vsftpd.conf
# copy user group
COPY ./vsftpd.userlist /etc/vsftpd.userlist
# set password for www-data
# RUN echo "www-data:$(openssl passwd -crypt 'password')" >> /etc/shadow
RUN mkdir /var/run/chroot-secured
# start ftp non deamon
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
# sleep infinity
# CMD ["sleep", "infinity"]