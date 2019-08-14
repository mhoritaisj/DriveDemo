@ECHO OFF

docker run -it --net drivedemonw --rm -v "%~dp0/code:/code" -v "%~dp0/data:/data" mqttclient python /code/gen_drivedata.py

