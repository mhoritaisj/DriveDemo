#!/bin/bash

docker run -it -p 1883:1883 -p 9001:9001 -v conf:/mosquitto/config -v data:/mosquitto/data -v log:/mosquitto/log eclipse-mosquitto
