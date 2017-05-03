#!/bin/bash
set -e

/usr/bin/freshclam -d

# Run clamd
exec /usr/sbin/clamd -c /etc/clamav/clamd.conf
