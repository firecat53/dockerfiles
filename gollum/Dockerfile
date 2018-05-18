FROM ruby:alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

# Install dependencies (and RST support: python-docutils)
RUN apk --no-cache add build-base \
                       git \
                       icu-dev \
                       icu-libs && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -Dh /home/gollum -G users -u $uid gollum && \
    mkdir /home/gollum/wiki && \
    chown -R $uid:$gid /home/gollum && \
    # Install gollum and markdown support
    gem install --no-document gollum github-markdown && \
    # Other markup flavors (uncomment as needed)
    # RST
    # apk --no-cache add python2 py2-docutils && \
    # Mediawiki
    # gem install --no-document asciidoctor && \
    # Creole
    # gem install --no-document creole && \
    # Org mode
    # gem install --no-document org-ruby && \
    # Textile
    # gem install --no-document RedCloth && \
    # MediaWiki
    # gem install --no-document wikicloth && \
    # Cleanup
    apk del build-base icu-dev

EXPOSE 4567

USER gollum
WORKDIR /home/gollum/wiki

ENTRYPOINT ["gollum"]
