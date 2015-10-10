# rpi-influxdb
influxdb on raspberry

# Prerequisites
* Raspberry PI based on ARM6 chip

# Usage
* Install Hypriot on your rpi
* Use following commands to build and run container
```
docker build --tag="influxdb" .
docker run --detach=true --name influxdb influxdb
```
Container is not intended to external publish its ports. If you want to connect to influxdb container, please use linking.
```
docker run --detach=true --device=/dev/ttyUSB0:/dev/ttyUSB0:rw --name teleinfo --link influxdb:influxdb --publish 8086 teleinfo
```
