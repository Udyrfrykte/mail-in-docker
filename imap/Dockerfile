FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y dovecot-core dovecot-imapd && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /var/mail/vmail -m

# Configure Dovecot
RUN rm -rf /etc/dovecot && mkdir /etc/dovecot
ADD dovecot.conf /etc/dovecot/dovecot.conf

RUN mkdir /var/mail/vmail/mailboxes && chown -R vmail:vmail /var/mail/vmail/mailboxes

EXPOSE 143
EXPOSE 993

COPY start.sh /start.sh
CMD ["/start.sh"]
