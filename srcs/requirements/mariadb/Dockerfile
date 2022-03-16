FROM debian:buster

#install mariadb
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server procps -y
# remove old sql config
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
# add new sql config
COPY sql.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# remove old sql data
RUN rm -rf /var/lib/mysql
# recreate sql data
RUN mkdir /var/lib/mysql
RUN chmod -R 700 /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql

COPY setup.sh .
RUN chmod +x setup.sh

CMD ["bash", "./setup.sh"]