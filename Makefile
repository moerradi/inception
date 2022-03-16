NAME=inception
SRCS= srcs/.env ./srcs/requirements/*
COMPFILE= docker-compose.yml
BONCOMPFILE= docker-compose-bonus.yml
WORKDIR := $(shell pwd)
DBDIR= srcs/requirements/mariadb/db-data

$(NAME): all

all:
	WORKDIR=$(WORKDIR)/srcs docker-compose -f $(WORKDIR)/srcs/$(COMPFILE) up --build -d

bonus:
	WORKDIR=$(WORKDIR)/srcs docker-compose -f $(WORKDIR)/srcs/$(BONCOMPFILE) up --build -d

clean:
	WORKDIR=$(WORKDIR)/srcs docker-compose -f $(WORKDIR)/srcs/$(COMPFILE) down
	WORKDIR=$(WORKDIR)/srcs docker-compose -f $(WORKDIR)/srcs/$(BONCOMPFILE) down

fclean: clean
	docker volume ls -q | xargs -r docker volume rm
	docker image ls -q | xargs -r docker image rm
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	docker volume prune -f
empty:
	sudo rm -rf $(DBDIR)
	mkdir $(DBDIR)

re: fclean all

.PHONY: all clean fclean re