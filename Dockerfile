FROM node:14-alpine as builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM node:14-alpine

WORKDIR /app

COPY --from=builder app/.next /app/.next
COPY --from=builder app/public /app/public
COPY --from=builder app/package*.json /app/
COPY --from=builder app/next-i18next.config.js /app/next-i18next.config.js
COPY --from=builder app/next.config.js /app/next.config.js

RUN yarn install --production

EXPOSE 3000
CMD [ "yarn", "start" ]