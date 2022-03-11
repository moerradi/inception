SRCS=./srcs/docker-compose.yml ./srcs/.env ./srcs/requirements/*

all:
	docker-compose up --build -d

clean:
	docker-compose down

fclean: clean
	docker system prune -f
	//delete all volumes
	docker volume rm $(docker volume ls -qf dangling=true)


re: fclean all

.PHONY: all clean fclean re