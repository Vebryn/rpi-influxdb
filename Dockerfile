FROM resin/rpi-raspbian

ENV INFLUXDB_VERSION=0.8.6 \
  ARCH=armhf \
  PRE_CREATE_DB=**None** \
  SSL_SUPPORT=**False** \
  SSL_CERT=**None**

# get deb using ADD because curl is not present into rpi-raspbian
ADD http://demos.pihomeserver.fr/influxdb_${INFLUXDB_VERSION}_${ARCH}.deb /tmp/influxdb_latest_${ARCH}.deb

RUN dpkg -i /tmp/influxdb_latest_${ARCH}.deb && \
  rm /tmp/influxdb_latest_${ARCH}.deb && \
  rm -rf /var/lib/apt/lists/*

ADD config.toml /config/config.toml
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Admin server, HTTP/HTTPS API, 
EXPOSE 8083 8086 8084

# Raft & Protobuf ports (for clustering, don't expose publicly!)
#EXPOSE 8090 8099

VOLUME ["/data"]
CMD ["/run.sh"]
