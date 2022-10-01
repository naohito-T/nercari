# ruby:3.1.2-slim
FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3 as nodejs

WORKDIR /tmp

RUN apt-get update -qqy \
    && apt-get install -qqy curl \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# # which node
# /usr/bin/node
# /usr/bin/yarn

FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3

COPY --from=nodejs /usr/bin/node /usr/bin/node
COPY --from=nodejs /usr/bin/yarn /usr/bin/yarn

# アプリケーション用userを作成（ubuntuだとuseraddはホームが作成されない）
# -m ユーザのホームディレクトリが存在しない場合、作成する。
# -u ユーザーID 作成するユーザーのユーザーIDを指定する。
RUN useradd -m -u 1000 rails
RUN mkdir /app && chown rails /app
# ユーザに対して所属グループの指定
USER rails

RUN apt-get update -qqy \
    && apt-get install -qqy --no-install-recommends make gcc git curl g++ default-libmysqlclient-dev xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /app

# バインドマウントはvolumeにする。node_modules vendor/bundle/
COPY --chown=rails Gemfile Gemfile.lock package.json yarn.lock /app/

RUN bundle install
RUN yarn install

COPY --chown=rails . /app

RUN bundle config set path vendor/bundle

# 実行時にコマンド指定が無い場合に実行されるコマンド
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
