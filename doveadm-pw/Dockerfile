FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y dovecot-core && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["doveadm", "pw", "-sSHA512-CRYPT"]
