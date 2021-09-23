FROM node:14-alpine

RUN npm -g install prisma1 --unsafe-perm

RUN mkdir -p /home/app/node && chown node /home/app/node

USER node

WORKDIR /home/app/node

COPY package.json ${WORKDIR}

RUN yarn install

COPY . ${WORKDIR}

ENV HOST=0.0.0.0 PORT=4000

EXPOSE ${PORT}

CMD [ "yarn", "start" ]