FROM ruby:2.6-alpine3.12

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ENV RACK_ENV=production
ENV PORT=8080
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.3/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=96960ba3207756bb01e6892c978264e5362e117e

WORKDIR /app

RUN apk --no-cache add build-base \ 
                       curl \
                       git \
                       gmp-dev \
                       linux-headers \
                       nodejs \
                       sqlite-dev \
                       s6 && \
    mkdir -p /etc/s6/cron && \
    mkdir /etc/s6/stringer && \
    ln -s /bin/true /etc/s6/cron/finish && \
    ln -s /bin/true /etc/s6/stringer/finish && \
    curl -fsSLO "$SUPERCRONIC_URL" && \
    echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - && \
    chmod +x "$SUPERCRONIC" && \
    mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" && \
    ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic && \
    git clone https://github.com/swanson/stringer.git . && \
    sed -i "s/.*/$RUBY_VERSION/" .ruby-version && \
    sed -i 's/^  gem "pg".*$/  gem "sqlite3", "~> 1.3", ">= 1.3.8"/' Gemfile && \
    sed -i '/^group :development, :test do/,/^end/d' Gemfile && \
    sed -i '/^group :development do/,/^end/d' Gemfile && \
    sed -i '/    enable :logging/a\\    ActiveRecord::Base.logger.level = Logger::WARN' app.rb && \
    bundle lock && \
    bundle install && \
    adduser -D -h /app/ stringer && \
    mkdir /data && \
    chown -R stringer:stringer /app /data && \
    apk del build-base curl git gmp-dev linux-headers

COPY database.yml /app/config/
COPY cron.start /etc/s6/cron/run
COPY stringer.start /etc/s6/stringer/run

EXPOSE 8080
VOLUME /data

ENTRYPOINT ["s6-svscan", "/etc/s6"]
