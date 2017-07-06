# Pull base image
FROM ubuntu:16.04

# Install software
RUN apt-get update && \
    apt-get install -y opendkim opendkim-tools openssl &&\
    rm -rf /var/lib/apt/lists/*

COPY genkey.sh /genkey.sh
ENTRYPOINT ["/genkey.sh"]
