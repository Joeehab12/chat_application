FROM ruby:2.5.1

RUN apt-get update -qq
RUN apt-get install -y mysql-server mysql-client phpmyadmin

COPY . /chat_application
WORKDIR /chat_application
RUN gem install bundler
RUN bundle config --global github.https
RUN gem install elasticsearch
RUN gem install elasticsearch-model
RUN gem install elasticsearch-rails
RUN bundle install
RUN bundle exec rails s
