FROM node:lts-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]
