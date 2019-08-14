@ECHO OFF

docker run -it --net drivedemonw --rm -v "$(pwd)/code:/code" -v "$(pwd)/data:/data" mqttclient python /code/gen_drivedata.py

