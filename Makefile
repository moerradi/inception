NAME=inception
SRCS= srcs/.env ./srcs/requirements/*
COMPFILE= ./srcs/docker-compose.yml
BONCOMPFILE= ./srcs/docker-compose-bonus.yml
DBDIR=/home/$(USER)/data/mysql_data
PORTAINERDB=/home/$(USER)/data/portainer_data
WPFILES=/home/$(USER)/data/wp_data

$(NAME): all

premake:
	mkdir -p $(DBDIR)
	mkdir -p $(PORTAINERDB)
	mkdir -p $(WPFILES)

all: premake
	docker-compose -f  $(COMPFILE) -p inception up --build -d

bonus: premake
	docker-compose -f   $(BONCOMPFILE) -p inception up --build -d

clean:
	docker-compose -f  $(COMPFILE) -p inception down

bonus_clean:
	docker-compose -f  $(BONCOMPFILE) -p inception down

cleanup:
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	docker volume ls -q | xargs -r docker volume rm
	docker image ls -q | xargs -r docker image rm

fclean: clean cleanup

bonus_fclean: bonus_clean cleanup

flush_db:
	sudo rm -rf $(DBDIR)
	mkdir -p $(PORTAINERDB)
	mkdir -p $(DBDIR)
	mkdir -p $(PORTAINERDB)
	mkdir -p $(WPFILES)

re: fclean all

logs:
	docker-compose -f $(COMPFILE) logs

bonus_logs:
	docker-compose -f $(BONCOMPFILE) logs

.PHONY: all clean fclean re