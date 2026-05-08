FROM ubuntu:latest

WORKDIR /usr/src/app

COPY example-frontend/ .

RUN apt update -y

RUN apt install -y curl 

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash

RUN apt update -y

RUN apt install -y nodejs

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install

RUN npm run build

RUN npm install -g serve

RUN useradd -m appuser && chown -R appuser:appuser /usr/src/app

EXPOSE 5001

USER appuser

CMD serve -s -l 5001 build

