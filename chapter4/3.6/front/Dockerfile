FROM ubuntu:latest

WORKDIR /usr/src/app

COPY example-frontend/ .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN apt update -y && \
	apt install -y curl && \
	curl -sL https://deb.nodesource.com/setup_16.x | bash && \
	apt update -y && \
	apt install -y nodejs && \
	npm install && \
	npm run build && \
	npm install -g serve && \
	useradd -m appuser && \
	chown -R appuser:appuser /usr/src/app && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5001

USER appuser

CMD serve -s -l 5001 build

