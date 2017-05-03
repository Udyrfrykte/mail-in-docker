FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y socat dovecot-core && \
    rm -rf /var/lib/apt/lists/*

# Configure Dovecot
RUN rm -rf /etc/dovecot && mkdir /etc/dovecot
ADD dovecot.conf /etc/dovecot/dovecot.conf

EXPOSE 9376

COPY start.sh /start.sh
CMD ["/start.sh"]
