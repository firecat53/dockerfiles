FROM ruby:2.3.3-slim

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV STRINGER_USER stringer
ENV UID 22000

COPY database.yml run.sh schedule.rb /

RUN apt-get -y update && \
    apt-get -qy install \
        git \
        libcurl4-openssl-dev \
        libpq-dev \
        libsqlite3-dev \
        build-essential && \
    gem install -N foreman rufus-scheduler && \
    useradd -g users --uid $UID --create-home $STRINGER_USER && \
    git clone https://github.com/swanson/stringer.git /home/$STRINGER_USER/stringer/ && \
    mv database.yml /home/$STRINGER_USER/stringer/config/ && \
    mv run.sh schedule.rb /home/$STRINGER_USER/stringer/ && \
    chown -R $STRINGER_USER:users /home/$STRINGER_USER /usr/local/bundle

USER stringer
WORKDIR /home/$STRINGER_USER/stringer
ENV RACK_ENV=production

# Sets the production database to sqlite and installs requirements
RUN mkdir data && \
    sed -i 's/^  gem "pg".*$/  gem "sqlite3", "~> 1.3", ">= 1.3.8"/' Gemfile && \
    sed -i '/^group :development do/,/^end/d' Gemfile && \
    sed -i '/pg/d' Gemfile.lock && \
    sed -i "s/.*/$RUBY_VERSION/" .ruby-version && \
    bundle update && \
    bundle install --deployment --without=development test && \
    sed -i 's/^console/#console/' Procfile

CMD ["./run.sh"]

# Cleanup
USER root
RUN apt-get autoremove -qy build-essential git && \
    rm -rf /var/lib/apt/lists/*
