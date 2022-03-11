FROM debian:buster

#install mariadb
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY setup.sh .
RUN chmod +x setup.sh


CMD ["bash", "setup.sh"]