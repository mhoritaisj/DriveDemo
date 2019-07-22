#!/bin/bash

#docker run --name iris-drive -t -p 51003:51773 -p 52003:52773 -v /Users/horita/Work/DriveData/IRIS-MQTT/projects:/projects -v /Users/horita/Work/DriveData/IRIS-MQTT/IRIS-MQTT-IoT-Adapter:/data intersystems/iris:2019.2.0.107.0

docker run --name iris-drive-com -t -p 51003:51773 -p 52003:52773 -v /Users/horita/Work/DriveData/IRIS-MQTT/projects:/projects -v /Users/horita/Work/DriveData/IRIS-MQTT/IRIS-MQTT-IoT-Adapter:/data store/intersystems/iris:2019.1.0.511.0-community

