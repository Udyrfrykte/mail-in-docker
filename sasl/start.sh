#!/bin/bash
set -e

parameters=(
  "USER_DN_TEMPLATE"
)

export USER_DN_TEMPLATE="${USER_DN_TEMPLATE:-uid=%n,ou=People,dc=example,dc=com}"

# Substitute configuration
for VARIABLE in ${parameters[@]}; do
  sed -i "s#{{ $VARIABLE }}#${!VARIABLE}#g" /etc/dovecot/dovecot-ldap.conf
done

# Run dovecot
exec /usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F
