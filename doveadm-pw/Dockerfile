FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y dovecot-core && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["doveadm", "pw"]
CMD ["-s", "SHA512-CRYPT"]
