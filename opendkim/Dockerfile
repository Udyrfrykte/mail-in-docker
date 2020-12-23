# Pull base image
FROM ubuntu:20.04

# Install software
RUN apt-get update && \
    apt-get install -y opendkim opendkim-tools && \
    rm -rf /var/lib/apt/lists/*

# Configure OpenDKIM
ADD KeyTable /etc/opendkim/
ADD SigningTable /etc/opendkim/
ADD TrustedHosts /etc/opendkim/
ADD opendkim.conf /etc/

# Expose port
EXPOSE 8891

COPY start.sh /start.sh
CMD ["/start.sh"]
