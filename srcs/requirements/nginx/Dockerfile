FROM debian:buster

#update and upgrade
RUN apt-get update && apt-get upgrade -y
#install nginx
RUN apt-get install nginx -y

# temporary measure to test nginx working
# RUN mkdir /var/wordpress
# COPY  index.html /var/wordpress/index.html
# tests passed !

RUN mkdir /var/ssl
COPY ./ssl_mount /var/ssl

# copy config 
COPY ./conf /etc/nginx/sites-available/
# enable config
RUN ln -s /etc/nginx/sites-available/conf /etc/nginx/sites-enabled/
# delete default conf
RUN rm /etc/nginx/sites-enabled/default
EXPOSE 80 443
# restart nginx
# RUN service nginx restart

CMD ["nginx", "-g", "daemon off;"]