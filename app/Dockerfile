FROM node:16-alpine

WORKDIR /hello-service/
COPY ./package.json /hello-service/
COPY ./yarn.lock /hello-service/
RUN yarn install

COPY . /hello-service/
CMD yarn start:dev