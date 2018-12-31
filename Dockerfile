FROM php:7.2-cli

COPY ./buildNeedFile/php/composer /usr/local/bin

RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \ 
    && docker-php-ext-install sockets \
    && apt-get update \
    && apt-get -y install libevent-dev libssl-dev libjpeg-dev libpng-dev \
    && pecl channel-update pecl.php.net \
    && pecl install event-2.4.2 \
    && docker-php-ext-enable event; 

WORKDIR /crawler 
