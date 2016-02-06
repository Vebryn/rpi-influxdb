FROM hypriot/rpi-golang

RUN mkdir -p src/github.com/influxdb \
	&& cd src/github.com/influxdb \
	&& git clone https://github.com/influxdb/influxdb.git \
	&& go get -u -f ./... \
	&& go build ./...

RUN mkdir /opt/influxdb \
	&& cd /opt/influxdb \
	&& cp /gopath1.5/bin/* . \
	&& cd /opt/influxdb \
	&& influxd config >influxdb.conf
