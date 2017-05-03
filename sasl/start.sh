#!/bin/bash
set -e

# Configure passwd.db
echo "${PASSWD_DB}" >| /etc/dovecot/passwd.db

# Run dovecot
exec /usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F
