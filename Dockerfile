FROM hypriot/rpi-golang

RUN mkdir -p src/github.com/influxdb \
	&& cd src/github.com/influxdb \
	&& git clone https://github.com/influxdb/influxdb.git \
	&& go get -u -f ./... \
	&& go build ./... \
	&& mkdir /opt/influxdb \
	&& cp /gopath1.5/bin/* /opt/influxdb
COPY influxdb.conf /opt/influxdb/influxdb.conf

EXPOSE 8083 8086 8088
VOLUME /opt/influxdb

CMD ["-config /opt/influxdb/influxdb.conf"]
ENTRYPOINT ["/opt/influxdb/influxd"]
