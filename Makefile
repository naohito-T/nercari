# https://github.com/ichikaraInc/Cuculus-Backend/blob/develop/Makefile

.PHONE: \
	up \
	down \
	build \
	server \
	watch \
	console

up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build --no-cache

# apiだけとりあえず起動したいとき
server:
	rails s

# tailwind watch
watch:
	rails tailwindcss:watch

console:
	rails c