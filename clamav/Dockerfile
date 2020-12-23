FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y clamav-daemon clamav-freshclam arj bzip2 cabextract cpio file gzip lhasa lzop nomarch p7zip pax rpm unrar-free unzip zip && \
    rm -rf /var/lib/apt/lists/*

# Configure ClamAV
ADD clamd.conf /etc/clamav/
ADD freshclam.conf /etc/clamav/

USER clamav
RUN freshclam

EXPOSE 3310

COPY start.sh /start.sh
CMD ["/start.sh"]
