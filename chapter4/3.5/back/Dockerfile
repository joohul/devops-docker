FROM golang:1.16

WORKDIR /usr/src/app

COPY example-backend/ .

RUN go build

RUN useradd -m appuser && chown -R appuser:appuser /usr/src/app

ENV PORT=8080

ENV REQUEST_ORIGIN=*

EXPOSE 8080

USER appuser

CMD ./server
