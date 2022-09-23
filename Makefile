# https://github.com/ichikaraInc/Cuculus-Backend/blob/develop/Makefile

.PHONE: \
	up \
	down \
	build \
	server \
	watch \
	console \
	format \
	format.fix \
	encrypt

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

format:
	rubocop

format.fix:
	rubocop -a

# config/settings/development.local.yml を更新してから以下を実行する
# パスワードを聞かれるのでこれまで設定してあったものと同じものを入れる
encrypt:
	bundle exec thor credentials:encrypt