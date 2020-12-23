FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y postfix postfix-ldap && \
    rm -rf /var/lib/apt/lists/*

# Configure Postfix
ADD main.cf /etc/postfix/
ADD master.cf /etc/postfix/
ADD ldap-users.cf /etc/postfix/ldap-users.cf
ADD ldap-aliases.cf /etc/postfix/ldap-aliases.cf
RUN chmod 644 /etc/postfix/main.cf /etc/postfix/master.cf /etc/postfix/ldap-users.cf /etc/postfix/ldap-aliases.cf

# Install templates
ADD aliases /etc/
ADD canonical /etc/postfix/
ADD virtual-mailbox-domains /etc/postfix/

EXPOSE 25
EXPOSE 587

COPY start.sh /start.sh
CMD ["/start.sh"]
