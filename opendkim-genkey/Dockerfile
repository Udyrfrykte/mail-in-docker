FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y opendkim opendkim-tools openssl &&\
    rm -rf /var/lib/apt/lists/*

COPY genkey.sh /genkey.sh
ENTRYPOINT ["/genkey.sh"]
