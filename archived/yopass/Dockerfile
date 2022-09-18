FROM golang:alpine as app

RUN apk add git && \
    git clone https://github.com/jhaals/yopass.git /yopass && \
    cd /yopass/cmd/yopass && \
    go get && \
    go build

FROM node:alpine as website

RUN apk add git && \
    git clone https://github.com/jhaals/yopass.git /yopass && \
    cd /yopass/website && \
    yarn install && \
    yarn build

FROM alpine
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

COPY --from=app /yopass/cmd/yopass/yopass /usr/local/bin/
COPY --from=website /yopass/website/build /public

RUN adduser -H -D yopass && \
    chown -R yopass /public

USER yopass

ENTRYPOINT ["yopass"]
