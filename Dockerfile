FROM sparkfabrik/docker-php-base-image:7.4.6-fpm-alpine3.10
ENV PHP_MEMORY_LIMIT 2048M
ENV COMPOSER_MEMORY_LIMIT -1

RUN apk add build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl
RUN docker-php-ext-install xml xsl

WORKDIR /app
RUN COMPOSER_HOME=/usr/local/composer \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  composer self-update --1

COPY metrics.sh /usr/local/bin/phpqa
COPY . /app
