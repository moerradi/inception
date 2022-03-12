lea
SRCS= ./srcs/.env ./srcs/requirements/*
COMPFILE= ./srcs/docker-compose.yml

all:
	docker-compose up --build -d -f=

clean:
	docker-compose down

fclean: clean
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	docker volume prune -f
	docker volume rm $(docker volume ls -qf dangling=true)


re: fclean all

.PHONY: all clean fclean re