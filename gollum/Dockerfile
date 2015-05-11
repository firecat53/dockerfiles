FROM ruby:2.0.0-slim

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV GOLLUM_USER firecat53
ENV UID 1000

# Install dependencies (and RST support: python-docutils)
RUN apt-get update && \
    apt-get install -y -q build-essential python2.7 python-docutils libicu-dev git-core

# Install gollum and markdown support
RUN gem install --no-document gollum redcarpet github-markdown

# Other markup flavors (uncomment as needed)
# Mediawiki
# RUN gem install --no-document asciidoctor
# Creole
# RUN gem install --no-document creole
# Org mode
# RUN gem install --no-document org-ruby
# Textile
# RUN gem install --no-document RedCloth
# MediaWiki
# RUN gem install --no-document wikicloth

# Cleanup
RUN apt-get autoremove -y build-essential && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Add wiki user and run script
RUN useradd -g users --uid $UID --create-home $GOLLUM_USER
COPY run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

# Expose default gollum port 4567
EXPOSE 4567

USER $GOLLUM_USER
WORKDIR /home/$GOLLUM_USER/wiki

ENTRYPOINT ["/usr/local/bin/run.sh"]
