# ruby:3.1.2-slim
FROM ruby@sha256:7a82cbe60f2a9fe0ec6a5872d957f21b2faff23551df55b5c9511a7a5136a9b3
ENV LANG C.UTF-8

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

RUN apt update -qqy \
    && apt install -qqy --no-install-recommends make gcc git curl g++ default-libmysqlclient-dev xz-utils\
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt install -qqy --no-install-recommends nodejs \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && gem install bundler

COPY . $APP_HOME

# Expose assets for web container
VOLUME $APP_HOME/public/assets

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
