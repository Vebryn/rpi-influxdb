# rpi-influxdb
Dockerfile to build and run Influxdb on a Raspberry Pi. It has been tested on Influxdb 0.9.4 and a armv6l chip (rpi A+/B+).

## Usage
```
docker build --tag="influxdb" .
docker run --detach=true --name influxdb influxdb
```
Container is not intended to external publish its ports. If you want to connect to influxdb container, please use linking.
```
docker run --detach=true --name grafana --publish=3000 --link influxdb:influxdb grafana
```
Before sending data to Influxdb, please create a database. Dockerfile doesn't create one.
