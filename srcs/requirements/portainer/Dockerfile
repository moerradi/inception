FROM debian:buster

#update and upgrade
RUN apt-get update && apt-get upgrade -y
# install portainer dependencies
RUN apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common \
	wget
# get portainer latest
RUN wget https://github.com/portainer/portainer/releases/download/2.11.1/portainer-2.11.1-linux-amd64.tar.gz
# extract portainer
RUN tar -xvf portainer-2.11.1-linux-amd64.tar.gz
# run portainer
WORKDIR /portainer
RUN mv ./public/locales/en ./public/locales/en-US
EXPOSE 7000
COPY start.sh .
CMD ["bash", "./start.sh"]