FROM node:23-alpine3.20
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app
USER node
COPY --chown=node:node . /app
RUN npm ci --only=production && npm cache clean --force
EXPOSE 3000
CMD ["node", "index.js"]