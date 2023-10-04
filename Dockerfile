FROM php:7.4.33-apache

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y gpg curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o histou.tar.gz -L https://github.com/Griesbacher/histou/archive/refs/heads/master.tar.gz

RUN mkdir -p /var/www/html/histou && tar xzf histou.tar.gz --strip-components 1 --directory /var/www/html/histou && rm histou.tar.gz

COPY histou.ini /var/www/html/histou/histou.ini
