FROM golang:1.16

WORKDIR /usr/src/app

COPY example-backend/ .

RUN go build

ENV PORT=8080

ENV REQUEST_ORIGIN=*

EXPOSE 8080

CMD ./server
