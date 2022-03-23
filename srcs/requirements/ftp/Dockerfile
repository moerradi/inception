FROM debian:buster
ARG FTP_USER
ARG FTP_PASSWORD
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
RUN useradd -ms /bin/bash ${FTP_USER}
RUN echo ${FTP_USER}:${FTP_PASSWORD} | chpasswd

# start ftp non deamon
COPY startup.sh .
RUN chmod +x startup.sh

CMD ["bash", "./startup.sh"]
# sleep infinity
# CMD ["sleep", "infinity"]