FROM composer:1
RUN apk add --no-cache \
    build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl libpng-dev && \
    docker-php-ext-install xml xsl gd

WORKDIR /app
COPY metrics.sh /usr/local/bin/phpqa

RUN COMPOSER_MEMORY_LIMIT=-1 composer global require hirak/prestissimo
COPY composer* ./
RUN composer install --ignore-platform-reqs -v --no-interaction --prefer-dist --no-progress

COPY . ./
