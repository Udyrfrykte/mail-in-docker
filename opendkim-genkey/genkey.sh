#!/bin/bash
set -e

usage()
{
cat << EOF

opendkim-genkey docker container usage

Generate a dkim key pair


USAGE: docker run opendkim-genkey -d <domain>

OPTIONS:
  -h    Show this message
  -d    domain of mail server

EXAMPLES:

  docker run bastienf/opendkim-genkey -d moi.ovh

EOF
}

while getopts ":d:h" flag
do
  case "$flag" in
    h)
      usage
      exit 0
      ;;
    d)
      DOMAIN=$OPTARG
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done

if [ -z "$DOMAIN" ]; then
  ERROR="${ERROR}Please provide a mail domain with -d.\n"
fi

# If we have errors, show the errors with usage data and exit.
if [ -n "$ERROR" ]; then
  echo -e $ERROR
  usage
  exit 1
fi

opendkim-genkey -r -h sha256 -s mail -d $DOMAIN

echo "============================================================================="
echo "                               mail.private"
echo "============================================================================="
cat mail.private
echo "============================================================================="
echo "                               mail.txt"
echo "============================================================================="
cat mail.txt
echo "============================================================================="
