FROM debian:buster

#update and upgrade
RUN apt-get update && apt-get upgrade -y
#intsall php
RUN apt-get install -y php7.3-cli php7.3-fpm php7.3-mysql php7.3-curl php7.3-gd php7.3-mbstring php7.3-xml php7.3-zip
RUN mkdir /run/php/
# remove old config 
RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf
#copy config
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN service php7.3-fpm restart
# CMD ["tail", "-f", "/dev/null"]
CMD ["php-fpm7.3", "-F", "-R"]
