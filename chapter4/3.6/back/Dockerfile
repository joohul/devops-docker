FROM golang:1.16

WORKDIR /usr/src/app

COPY example-backend/ .

RUN go build && useradd -m appuser && chown -R appuser:appuser /usr/src/app && rm -rf cache/

ENV PORT=8080

ENV REQUEST_ORIGIN=*

EXPOSE 8080

USER appuser

CMD ./server
