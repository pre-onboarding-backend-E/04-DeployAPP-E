FROM  node:16-alpine

WORKDIR /deploy-app/
RUN apk update
RUN apk upgrade
RUN apk --no-cache add tzdata && \
        cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
        echo "Asia/Seoul" > /etc/timezone
COPY package*.json ./
COPY ./yarn.lock  /deploy-app/
RUN yarn install
COPY . /deploy-app/
CMD yarn start:dev
