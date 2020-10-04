FROM nodered/node-red:latest-12
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
