FROM nginx:alpine

RUN addgroup -g 1000 appgroup && \
    adduser -D -u 1000 -G appgroup appuser

WORKDIR /app

RUN touch /run/nginx.pid

RUN mkdir /certs

COPY ./certs/ /certs 

RUN chown -R appuser:appgroup /app /etc/nginx /var/cache/nginx /run/nginx.pid /certs /var/log/nginx

COPY nginx.conf /etc/nginx

RUN apk add --no-cache bash

USER appuser