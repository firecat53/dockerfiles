ARG ALPINE_LINUX_VERSION="3.18"
ARG BASE_IMAGE_ARCH="amd64"

FROM golang:1-alpine${ALPINE_LINUX_VERSION} as build
WORKDIR /go/src/app
ARG APP_ARCH="amd64"
RUN apk add --no-cache --update build-base curl git && \
    APP_VERSION=$(curl -sX GET "https://api.github.com/repos/miniflux/miniflux/releases/latest" \
                  | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    git clone https://github.com/miniflux/miniflux.git . && \
    echo ${APP_VERSION} && \
    make linux-${APP_ARCH} VERSION=${APP_VERSION} && \
    cp /go/src/app/miniflux-linux-${APP_ARCH} /go/src/app/miniflux

FROM ${BASE_IMAGE_ARCH}/alpine:${ALPINE_LINUX_VERSION}
ENV LISTEN_ADDR 0.0.0.0:8080
RUN apk --no-cache add ca-certificates tzdata
COPY --from=build /go/src/app/miniflux /usr/local/bin/miniflux
USER nobody
EXPOSE 8080
CMD ["miniflux"]
