FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends clamav-milter && \
    rm -rf /var/lib/apt/lists/*

# Configure milter
ADD clamav-milter.conf /etc/clamav/

EXPOSE 8891

CMD ["/usr/sbin/clamav-milter", "-c", "/etc/clamav/clamav-milter.conf"]
