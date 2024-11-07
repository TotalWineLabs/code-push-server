FROM node:20.17.0-alpine3.20
WORKDIR /app
ADD api .
RUN npm install
RUN npm run build
CMD ["node", "bin/script/server.js"]


