FROM ruby:2.5.1

RUN apt-get update -qq

COPY . /chat_application
WORKDIR /chat_application
RUN gem install bundler
RUN bundle config --global github.https true

RUN bundle install
RUN rails server -d
