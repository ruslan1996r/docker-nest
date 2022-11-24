# Final build size 89.9MB
# https://hub.docker.com/repository/docker/goregrish/ruslan1996r-cart-api
FROM node:8-alpine

WORKDIR /usr/src/api

COPY package*.json ./
COPY dist/ .

RUN npm ci --production

ENV PORT=3000
EXPOSE 3000

CMD [ "node", "main.js" ]