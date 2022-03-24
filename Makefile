NAME=inception
SRCS= srcs/.env ./srcs/requirements/*
COMPFILE= ./srcs/docker-compose.yml
BONCOMPFILE= ./srcs/docker-compose-bonus.yml
DBDIR= srcs/requirements/mariadb/db-data

$(NAME): all

all:
	# sudo chown -R $(USER) $(DBDIR)
	docker-compose -f $(COMPFILE) up --build -d

bonus:
	# sudo chown -R $(USER) $(DBDIR)
	docker-compose -f $(BONCOMPFILE) up --build -d

clean:
	# sudo chown -R $(USER) $(DBDIR)
	docker-compose -f $(COMPFILE) down

bonus_clean:
	# sudo chown -R $(USER) $(DBDIR)
	docker-compose -f $(BONCOMPFILE) down

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
	mkdir $(DBDIR)

re: fclean all

logs:
	docker-compose -f $(COMPFILE) logs
bonus_logs:
	docker-compose -f $(BONCOMPFILE) logs

.PHONY: all clean fclean re