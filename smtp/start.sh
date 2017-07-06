#!/bin/bash
set -e

# Configure aliases
echo "${ALIASES}" >| /etc/postfix/virtual-aliases
echo "${ALIASES_REGEX}" >| /etc/postfix/virtual-aliases-re

export DOMAIN="${DOMAIN:-example.com}"

# Substitute configuration
VARIABLES=(
  DOMAIN
)
for VARIABLE in "${VARIABLES[@]}"; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/main.cf
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/aliases
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/canonical
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/virtual-mailbox-domains
done

newaliases

# generate user configuration
echo "${USERS}" | sed "s/\(.*\)/\1@${DOMAIN} \1@${DOMAIN}/" >| /etc/postfix/virtual-mailbox-users

rm -f /var/run/rsyslogd.pid

# launch syslog
rsyslogd
# lauch postfix
postfix start

while ! /usr/lib/postfix/sbin/master -t; do
  sleep 10
  echo running
done
