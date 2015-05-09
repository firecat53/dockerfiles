FROM ruby:2.0.0-slim

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y install git libcurl4-openssl-dev libpq-dev libsqlite3-dev build-essential 
RUN gem install -N foreman rufus-scheduler
RUN useradd -g users --uid 22000 --create-home stringer

RUN git clone https://github.com/swanson/stringer.git /stringer && \
    mkdir /stringer/data
ADD ./database.yml /stringer/config/database.yml
ADD ./run.sh /stringer/run.sh
ADD ./schedule.rb /stringer/schedule.rb

RUN chown -R stringer:users /stringer

USER stringer
ENV RACK_ENV=production

WORKDIR /stringer
# Sets the production database to sqlite
RUN sed -i 's/^  gem "pg".*$/  gem "sqlite3", "~> 1.3", ">= 1.3.8"/' Gemfile && \
    sed -i '/^group :development do/,/^end/d' Gemfile && \
    sed -i '/pg/d' Gemfile.lock

RUN bundle install --deployment
RUN sed -i 's/^console/#console/' Procfile

CMD ["./run.sh"]
