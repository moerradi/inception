FROM debian:buster as build

# update and upgrade
WORKDIR /app
RUN apt-get update && apt-get upgrade -y
# install curl
RUN apt-get install curl nginx -y
# install node 16 and npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
# install dependencies
COPY package.json .
RUN npm install
# build
COPY . .
RUN npm run build
RUN mkdir /var/portfolio
RUN mv dist/* /var/portfolio/

RUN  mv ./conf /etc/nginx/sites-available/
# enable config
RUN ln -s /etc/nginx/sites-available/conf /etc/nginx/sites-enabled/
# delete default conf
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 5000
# nginx
CMD ["nginx", "-g", "daemon off;"]