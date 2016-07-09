FROM ubuntu:14.04.3
MAINTAINER Christian Calloway <callowaylc@gmail.com>

# Main ##########################################

RUN true && \
  mkdir -p /tmp/torrent/download && \
  mkdir -p /tmp/torrent/session && \
  apt-get update && \
  apt-get install -y
    rtorrent

COPY root/ /root/
COPY usr/ /usr/

# Volumes #######################################

VOLUME ["/tmp/torrent/session", "/tmp/torrent/download"]

 # Run ###########################################

ENTRYPOINT [ "/usr/bin/rtorrent" ]
CMD [ "-h" ]
