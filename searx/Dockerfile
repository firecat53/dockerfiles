FROM alpine:3.18
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add --virtual run-required \
            ca-certificates \
            libxml2 \
            libxslt \
            python3 \
            py3-certifi \
            py3-charset-normalizer \
            py3-idna \
            py3-six \
            py3-yaml && \
    apk --no-cache add --virtual build \
           build-base \
           git \
           libffi-dev \
           libxml2-dev \
           libxslt-dev \
           openssl-dev \
           python3-dev \
           py3-pip \
           py3-setuptools \
           py3-wheel && \
	git clone https://github.com/searx/searx /tmp/searx && \
	cd /tmp/searx && \
    pip install -r requirements.txt && \
    pip install . && \
    find /usr/lib/ -type f -name 'webapp.py' -path '*searx*' -exec cp '{}' /usr/local/bin/ \; && \
    adduser -Dh /config -G users searx && \
    echo "searx:searx" | chpasswd && \
    chown -R searx:users /config && \
	# Cleanup
	rm -rf /tmp/searx /root/.cache && \
	apk del build 

COPY settings.yml /config

USER searx
ENV SEARX_SETTINGS_PATH=/config/settings.yml
WORKDIR /config
VOLUME ["/config"]

CMD ["python3", "/usr/local/bin/webapp.py"]
