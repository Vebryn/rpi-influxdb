# rpi-influxdb
Dockerfile to build and run Influxdb on a Raspberry Pi. It has been tested on Influxdb 0.9.4 and a armv6l chip (rpi A+/B+).

# Usage
```
docker build --tag="influxdb" .
docker run --detach=true --name influxdb influxdb
```
Container is not intended to external publish its ports. If you want to connect to influxdb container, please use linking.
```
docker run --detach=true --device=/dev/ttyUSB0:/dev/ttyUSB0:rw --name teleinfo --link influxdb:influxdb --publish 8086 teleinfo
```
