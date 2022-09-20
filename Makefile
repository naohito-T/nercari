# https://github.com/ichikaraInc/Cuculus-Backend/blob/develop/Makefile

.PHONE: \
	up \
	down \
	build

up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build --no-cache