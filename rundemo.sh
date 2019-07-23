#!/bin/bash

cd DataGenerator
docker build . -t mqttclient

cd ..
docker-compose -f docker-compose-demo.yml up -d --build

