FROM  node:16-alpine

WORKDIR /deploy-app/
RUN apk update
RUN apk upgrade
RUN apk --no-cache add tzdata && \
        cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
        echo "Asia/Seoul" > /etc/timezone
COPY . .
RUN yarn install
CMD yarn start:dev

# COPY package*.json ./
# COPY ./yarn.lock  /deploy-app/
# COPY default.conf ./nginx/default.conf
# COPY . /deploy-app/
# CMD ["nginx", "-g", "daemon off;"]

# FROM nginx:latest

# COPY default.conf ./nginx/default.conf
# CMD ["nginx", "-g", "daemon off;"]