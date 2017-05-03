FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y socat dovecot-core dovecot-sieve dovecot-lmtpd && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /var/mail/vmail -m

# Configure Dovecot
RUN rm -rf /etc/dovecot && mkdir /etc/dovecot
ADD dovecot.conf /etc/dovecot/dovecot.conf

# sieve
RUN mkdir /var/mail/vmail/sieve-before && mkdir /var/mail/vmail/sieve-after
ADD masterfilter.sieve /var/mail/vmail/sieve-after/
RUN chmod 644 /var/mail/vmail/sieve-after/masterfilter.sieve

RUN chown -R vmail:vmail /var/mail/vmail/sieve-before /var/mail/vmail/sieve-after

RUN mkdir /var/mail/vmail/mailboxes && chown -R vmail:vmail /var/mail/vmail/mailboxes
RUN mkdir /var/mail/vmail/sieveboxes && chown -R vmail:vmail /var/mail/vmail/sieveboxes

EXPOSE 24

COPY start.sh /start.sh
CMD ["/start.sh"]
