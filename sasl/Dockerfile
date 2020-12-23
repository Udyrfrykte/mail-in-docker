FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y dovecot-core dovecot-ldap && \
    rm -rf /var/lib/apt/lists/*

# Configure Dovecot
RUN rm -rf /etc/dovecot && mkdir /etc/dovecot
ADD dovecot.conf /etc/dovecot/dovecot.conf
ADD dovecot-ldap.conf /etc/dovecot/dovecot-ldap.conf

EXPOSE 9376

COPY start.sh /start.sh
CMD ["/start.sh"]
