FROM debian:buster

#update and upgrade
RUN apt-get update && apt-get upgrade -y
# install redis
RUN apt-get install -y redis-server
# setup redis password
COPY setup.sh .
# start redis
CMD ["redis-server"]
