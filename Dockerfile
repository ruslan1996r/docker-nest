# # goregrish/ruslan1996r-cart-api

# FROM node:8-alpine

# WORKDIR /usr/src/api

# # COPY dist .
# ADD dist/ .

# # The community seems to have concluded that it is generally not recommended to bundle
# # and tree-shake complex NodeJS server apps.  Dependencies should be installed
# # in the docker image directly.  It would be nice, but there are too many issues.
# # Correctness is the lowest denominator. ^_^
# # Refer to: https://github.com/nestjs/nest/issues/1706
# # ------------------------------------------------------------------
# COPY package*.json ./

# RUN npm ci --production

# # ENV PORT=3000
# EXPOSE 3000

# CMD [ "node", "main.js" ]

FROM node:18-alpine as appbuild
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
COPY tsconfig.json tsconfig.build.json ./
RUN yarn install
COPY src ./src
RUN yarn run build

FROM node:18-alpine as production
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn --production
COPY --from=appbuild /usr/src/app/dist ./
EXPOSE 3000
CMD yarn run start:prod