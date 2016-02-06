# rpi-influxdb
2 dockerfiles to build and run Influxdb on a Raspberry Pi. They have been tested on Influxdb 0.10.0 and a armv6l chip (rpi A+/B+).

Dockerfile build Influxdb binaries. Dockerfile-lite untar Influxdb binaries.

## Build influxdb
Build Docker image, influxdb binaries will be build in this step
    
    docker build --tag="influxdb" .

Start container, bash interpreter will be started, container mnt dir will be bind to host mnt dir

    docker run --rm --tty --interactive --name influxdb --volume /mnt:/mnt influxdb bash

You can copy generated binaries into /mnt, files will be available on host mnt dir.

## Run influxdb / Lite version
Lite version uses a compiled Influxdb archive. If you don't have one, please compile it using default Dockerfile and extract binaries. Lite version has a smaller size and require less time to build.

To build lite version, specify Dockerfile name to Docker

    docker build -f Dockerfile-lite .

Container is not intended to external publish its ports. If you want to connect to influxdb container, please use linking.

    docker run --detach=true --name grafana --publish=3000 --link influxdb:influxdb grafana

Before sending data to Influxdb, please create a database. Dockerfile doesn't create one.
