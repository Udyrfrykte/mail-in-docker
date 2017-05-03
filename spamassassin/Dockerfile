FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y spamass-milter pyzor razor libmail-dkim-perl && \
    rm -rf /var/lib/apt/lists/*

# Configure SpamAssassin
RUN mkdir /var/spool/spamassassin
ADD init.pre /etc/spamassassin/
ADD local.cf /etc/spamassassin/
RUN sa-update

# Razor2 and Pyzor
RUN mkdir /var/lib/spamassassin/.razor && mkdir /var/lib/spamassassin/.pyzor
RUN pyzor --homedir /var/lib/spamassassin/.pyzor discover
RUN razor-admin -home=/var/lib/spamassassin/.razor -register &&\
    razor-admin -home=/var/lib/spamassassin/.razor -create &&\
    razor-admin -home=/var/lib/spamassassin/.razor -discover
ADD razor-agent.conf /var/lib/spamassassin/.razor/

RUN chown -R debian-spamd:debian-spamd /var/lib/spamassassin /var/spool/spamassassin /etc/spamassassin

EXPOSE 8891

CMD ["/bin/bash", "-c", "/usr/sbin/spamd -x --max-children 5 -u debian-spamd -g debian-spamd --helper-home-dir /var/lib/spamassassin --siteconfigpath /etc/spamassassin --socketpath=/var/spool/spamassassin/spamd.sock -d --pidfile=/var/run/spamd.pid -s /var/log/spamd.log && /usr/sbin/spamass-milter -P /var/run/spamass.pid -p inet:8891 -m -I -- --socket=/var/spool/spamassassin/spamd.sock"]
