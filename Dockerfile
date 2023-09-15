FROM composer:2.3.5
RUN apk add --no-cache \
    build-base libxslt-dev libxml2-dev libgcrypt-dev git unzip wget curl libpng-dev py3-pip && \
    docker-php-ext-install xml xsl gd

WORKDIR /app
COPY metrics.sh /usr/local/bin/phpqa

COPY composer* ./
RUN composer install --ignore-platform-reqs -v --no-interaction --prefer-dist --no-progress

COPY . ./

RUN pip install djlint --root-user-action=ignore
