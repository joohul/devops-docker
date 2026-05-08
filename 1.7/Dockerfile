FROM ubuntu:24.04

WORKDIR /usr/src/app

COPY script.sh .

RUN apt update -y

RUN apt install -y curl

CMD ["./script.sh"]
