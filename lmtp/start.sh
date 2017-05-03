#!/bin/bash
set -e

export POSTMASTER_ADDRESS="${POSTMASTER_ADDRESS:-postmaster@example.com}"

# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/dovecot/dovecot.conf
done

# Run dovecot
exec /usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F
