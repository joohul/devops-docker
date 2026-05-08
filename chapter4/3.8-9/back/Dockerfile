# Build stage
FROM golang:1.16-alpine AS builder

WORKDIR /usr/src/app

COPY example-backend/ .

RUN CGO_ENABLED=0 go build -o server

# Runtime stage
FROM scratch

COPY --from=builder /usr/src/app/server /

ENV PORT=8080

ENV REQUEST_ORIGIN=*

EXPOSE 8080

CMD ["/server"]
