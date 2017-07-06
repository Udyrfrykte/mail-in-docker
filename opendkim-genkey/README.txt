Inspired by http://arstechnica.com/information-technology/2014/02/how-to-run-your-own-e-mail-server-with-your-own-domain-part-1/

to create a dkim pair :

docker build -t opendkim-genkey . && docker run opendkim-genkey -d moi.ovh
