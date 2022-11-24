# goregrish/ruslan1996r-cart-api
FROM node:8-alpine

WORKDIR /usr/src/api

COPY dist/ .

# The community seems to have concluded that it is generally not recommended to bundle
# and tree-shake complex NodeJS server apps.  Dependencies should be installed
# in the docker image directly.  It would be nice, but there are too many issues.
# Correctness is the lowest denominator. ^_^
# Refer to: https://github.com/nestjs/nest/issues/1706
# ------------------------------------------------------------------
COPY package*.json ./

RUN npm ci --production

ENV PORT=3000
EXPOSE 3000

CMD [ "node", "main.js" ]