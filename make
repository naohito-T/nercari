#!/usr/bin/env bash
# set -ex pipefail
# ---------------------------------------------------
# Makefileを書くのは辛いためシェルスクリプトのタスクランナー
# ---------------------------------------------------

# function catch() {

# }

function load() {
  source ./bin/usage
  source ./bin/alias
}

# function make() {

# }


# up:
#   docker-compose -p nercari up

# # TODO 依存で他のやつを実行して和kうぇる
# init:
#   docker-compose run --rm app bundle install && docker-compose up -d && docker-compose run --rm app bundle exec rails db:create

# migration:
#   docker-compose run --rm app bundle exec rails db:migrate

# up.prod:
#   docker-compose up -f docker-compose-prod.yml

# down:
#   docker-compose down

# # BuildKitを有効化する
# # https://docs.docker.jp/develop/develop-images/build_enhancements.html
# build:
#   DOCKER_BUILDKIT=1 docker-compose build --no-cache

# # apiだけとりあえず起動したいとき
# server:
#   rails s

# con:
#   rails g controller $(resource)

# # for devise
# model:
#   rails g devise $(name)

# # tailwind watch
# watch:
#   rails tailwindcss:watch

# console:
#   rails c

# format:
#   rubocop

# format.fix:
#   rubocop -a

# # config/settings/development.local.yml を更新してから以下を実行する
# # パスワードを聞かれるのでこれまで設定してあったものと同じものを入れる
# encrypt:
#   bundle exec thor credentials:encrypt

# decrypt:
#   bundle exec thor credentials:decrypt

# # config/credentials.yml.encを編集する EDITOR=code
# credentials.edit:
#   bin/rails credentials:edit

function main() {
    local args="${1:-nothing}"
    case "$args" in
        # "all" )
        #     core.all "${@:2:($#)}"
        # exit 0 ;;
        # "clear" )
        #     core.clear "${@:2:($#)}"
        # exit 0 ;;
        # "peek" | "top" )
        #     core.peek  "${@:2:($#)}"
        # exit 0 ;;
        # "pop" )
        #   core.pop  "${@:2:($#)}"
        # exit 0 ;;
        "help" )
          usage
        exit 0 ;;
        "nothing" )
          usage
        exit 0 ;;
    esac
}


# file load
load
# main
make "$@"