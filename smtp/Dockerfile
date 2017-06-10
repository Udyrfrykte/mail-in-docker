FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y postfix rsyslog && \
    rm -rf /var/lib/apt/lists/*

# Configure Postfix
ADD main.cf /etc/postfix/
ADD master.cf /etc/postfix/
RUN chmod 644 /etc/postfix/main.cf /etc/postfix/master.cf

# Install templates
ADD aliases /etc/
ADD canonical /etc/postfix/
ADD virtual-mailbox-domains /etc/postfix/

EXPOSE 25
EXPOSE 587

COPY start.sh /start.sh
CMD ["/start.sh"]
