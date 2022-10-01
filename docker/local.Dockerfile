# local Docker方針
# localに関してはバインドマウントでディレクトリとライブラリインストールディレクトリ（node vendor/bundle）をマウントするためroot権限でいい。
# ruby:3.1.2-slim
FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3 as nodejs

WORKDIR /tmp

RUN apt-get update -qqy \
    && apt-get upgrade -qqy \
    && apt-get install -qqy curl \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -qqy nodejs \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# # which node
# /usr/bin/node
# /usr/bin/yarn

# 本番はbuildしたやつとかをコピーしたい。
FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3 AS builder

FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3

COPY --from=nodejs /usr/bin/node /usr/bin/node
COPY --from=nodejs /usr/bin/yarn /usr/bin/yarn

RUN apt-get update -qqy \
    && apt-get upgrade -qqy \
    && apt-get install -qqy --no-install-recommends make gcc git build-essential libpq-dev apt postgresql-client g++ xz-utils tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /app

# 実行時にコマンド指定が無い場合に実行されるコマンド
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
