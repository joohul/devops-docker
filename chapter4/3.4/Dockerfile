FROM docker:25-git

WORKDIR /usr/src/app

COPY builder.sh .

RUN chmod +x builder.sh

ENTRYPOINT ["/bin/sh", "./builder.sh"]