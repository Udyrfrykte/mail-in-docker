#!/bin/bash
set -e

parameters=(
  "DOMAIN"
  "BIND_DN"
  "BIND_PW"
  "USERS_SEARCH_BASE"
  "ALIASES_SEARCH_BASE"
)

# Configure aliases
echo "${ALIASES_REGEX}" >| /etc/postfix/virtual-aliases-re

export DOMAIN="${DOMAIN:-example.com}"

# Substitute configuration
for VARIABLE in "${parameters[@]}"; do
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/postfix/main.cf
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/aliases
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/postfix/canonical
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/postfix/virtual-mailbox-domains
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/postfix/ldap-users.cf
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/postfix/ldap-aliases.cf
done

# launch rsyslog
rm -f /var/run/rsyslogd.pid
rsyslogd

# launch postfix
exec /usr/lib/postfix/sbin/master -d
