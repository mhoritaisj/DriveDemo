FROM node:10

WORKDIR /usr/src/app


COPY package*.json ./
RUN npm install

COPY server.js main.html apikey.txt* ./
#COPY main.html ./
#COPY apikey.txt ./

RUN [ -f apikey.txt ] && \
	APIKEY=`cat apikey.txt` && sed -e "s/@@KEY@@/${APIKEY}/g" -e "s///" main.html > main-generated.html || \
	cp main.html main-generated.html

EXPOSE 8080
ENTRYPOINT [ "node", "server.js" ]
