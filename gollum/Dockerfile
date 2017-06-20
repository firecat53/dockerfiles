FROM ruby:slim

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV GOLLUM_USER gollum
ENV UID 22000

COPY run.sh /usr/local/bin/run.sh

# Install dependencies (and RST support: python-docutils)
RUN apt-get update && \
    apt-get install -qy build-essential \
                        python2.7 \
                        python-docutils \
                        libicu-dev \
                        git-core && \
    useradd -g users --uid $UID --create-home $GOLLUM_USER && \
    # Add wiki user and run script
    chmod 755 /usr/local/bin/run.sh && \
    # Install gollum and markdown support
    gem install --no-document gollum github-markdown && \
    # Other markup flavors (uncomment as needed)
    # Mediawiki
    # gem install --no-document asciidoctor
    # Creole
    # gem install --no-document creole
    # Org mode
    # gem install --no-document org-ruby
    # Textile
    # gem install --no-document RedCloth
    # MediaWiki
    # gem install --no-document wikicloth
    # Cleanup
    apt-get autoremove -y build-essential && \
    rm -rf /var/lib/apt/lists/*


# Expose default gollum port 4567
EXPOSE 4567

USER $GOLLUM_USER
WORKDIR /home/$GOLLUM_USER/wiki

ENTRYPOINT ["/usr/local/bin/run.sh"]
