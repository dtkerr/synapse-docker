FROM debian:stretch-slim
LABEL maintainer "Terry Kerr <t@xnr.ca>"

RUN echo 'deb http://matrix.org/packages/debian stretch main' \
        > /etc/apt/sources.list.d/matrix.list && \
    apt-get update -y && \
    apt-get install \
        python-lxml \
        python-psycopg2 \
        libxslt1-dev \
        matrix-synapse \
        --allow-unauthenticated -y

ENTRYPOINT ["/usr/bin/python2", "-m", "synapse.app.homeserver"]
CMD ["-c", "/etc/matrix-synapse/homeserver.yml"]
