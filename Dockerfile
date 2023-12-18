FROM composer:2.3.5
RUN apk add --no-cache \
    build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl libpng-dev py3-pip && \
    docker-php-ext-install xml xsl gd

RUN pip install djlint --root-user-action=ignore

COPY composer* ./
RUN composer install --no-interaction --prefer-dist --no-progress

COPY . ./
COPY metrics.sh /usr/local/bin/phpqa

WORKDIR /app
