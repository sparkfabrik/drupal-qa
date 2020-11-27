FROM composer:1
RUN apk add build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl
RUN docker-php-ext-install xml xsl

WORKDIR /app

COPY metrics.sh /usr/local/bin/phpqa
COPY . /app
RUN composer install
