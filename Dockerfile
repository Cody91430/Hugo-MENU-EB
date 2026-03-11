FROM node:20-alpine

WORKDIR /home/node/app

RUN apk update && apk upgrade --no-cache && chown -R node:node /home/node

COPY --chown=node:node package*.json ./

USER node

RUN npm ci --omit=dev

COPY --chown=node:node . .

EXPOSE 3000

CMD ["node", "server.js"]
