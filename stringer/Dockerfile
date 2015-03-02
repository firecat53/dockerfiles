FROM ruby:2.0.0-slim

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y install git libcurl4-openssl-dev libpq-dev libsqlite3-dev build-essential 
RUN gem install -N foreman rufus-scheduler
RUN useradd -g users --uid 22000 --create-home stringer

RUN git clone https://github.com/swanson/stringer.git /stringer && chown -R stringer:users /stringer

USER stringer
ENV RACK_ENV=production STRINGER_DATABASE=stringerdb STRINGER_DATABASE_USERNAME=stringer

WORKDIR /stringer
RUN bundle install --deployment
ADD ./run.sh run.sh
ADD ./schedule.rb schedule.rb
RUN sed -i 's/^console/#console/' Procfile

CMD ["./run.sh"]
