FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y dovecot-core dovecot-ldap dovecot-managesieved && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /var/mail/vmail -m

# Configure Dovecot
RUN rm -rf /etc/dovecot && mkdir /etc/dovecot
ADD dovecot.conf /etc/dovecot/dovecot.conf
ADD dovecot-ldap.conf /etc/dovecot/dovecot-ldap.conf

RUN mkdir /var/mail/vmail/sieveboxes && chown -R vmail:vmail /var/mail/vmail/sieveboxes

EXPOSE 4190

COPY start.sh /start.sh
CMD ["/start.sh"]
