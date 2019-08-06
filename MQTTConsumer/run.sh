#!/bin/bash

docker build -t mqtt-client-jpn .
docker run --init -it --rm --net="mqttnw" mqtt-client-jpn sub -h mqttbroker -t "DriveDemo/Event" -v

