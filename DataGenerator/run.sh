#!/bin/bash

docker run -it --net mqttnw --rm -v "$PWD"/code:/code -v "$PWD"/data:/data mqttclient python /code/gen_drivedata.py

