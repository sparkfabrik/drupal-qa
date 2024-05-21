FROM composer:2.7.6
RUN apk add --no-cache \
    build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl libpng-dev py3-pip && \
    docker-php-ext-install xml xsl gd

COPY composer* ./
RUN composer install --no-interaction --prefer-dist --no-progress

COPY . ./
COPY metrics.sh /usr/local/bin/phpqa

WORKDIR /app
