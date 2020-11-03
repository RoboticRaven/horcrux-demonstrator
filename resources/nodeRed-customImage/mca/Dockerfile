FROM nodered/node-red:latest-12

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
USER root
RUN apk update && apk add libtool autoconf automake
COPY package.json .
COPY ./node-red-contrib-ethr-genaddress /tmp/ethr-genaddress
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
RUN cd /usr/src/node-red && npm install --unsafe-perm /tmp/ethr-genaddress
CMD ["npm", "start"]
