# Check out https://hub.docker.com/_/node to select a new base image
FROM node:10-slim

RUN npm -g install prisma1 --unsafe-perm

RUN npm -g i apollo-server-core
# Set to a non-root built-in user `node`
USER node

RUN mkdir -p /home/node/app
# Create app directory (with user `node`)
WORKDIR /home/node/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --chown=node package*.json ./

RUN yarn install
# Bundle app source code
COPY --chown=node . .
# Bind to all network interfaces so that it can be mapped to the host OS
ENV HOST=0.0.0.0 PORT=4000

EXPOSE ${PORT}

CMD [ "yarn", "deploy" ]