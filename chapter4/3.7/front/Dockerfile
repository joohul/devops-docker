FROM node:16-alpine

WORKDIR /usr/src/app

COPY example-frontend/ .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN apk add --no-cache curl && \
	npm install && \
	npm run build && \
	npm install -g serve && \
	adduser -D appuser && \
	chown -R appuser:appuser /usr/src/app

EXPOSE 5001

USER appuser

CMD serve -s -l 5001 build

