FROM node:10

WORKDIR /usr/src/app


COPY package*.json ./
RUN npm install

COPY server.js ./
COPY main.html ./
COPY apikey.txt ./

RUN APIKEY=`cat apikey.txt` && sed -e "s/@@KEY@@/${APIKEY}/g" -e "s///" main.html > main-generated.html

EXPOSE 8080
ENTRYPOINT [ "node", "server.js" ]
