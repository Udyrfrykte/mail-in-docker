#!/bin/bash
set -e

export DOMAIN="${DOMAIN:-example.com}"

# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/opendkim/KeyTable
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/opendkim/SigningTable
done

# Run dovecot
exec /usr/sbin/opendkim -f -x /etc/opendkim.conf
