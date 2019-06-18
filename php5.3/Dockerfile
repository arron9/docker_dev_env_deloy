FROM undefinedor/php53

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        wget \
        git \
            --no-install-recommends

RUN docker-php-ext-install zip intl mbstring exif \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

ENV PHPREDIS_VERSION 4.1.1

RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \

&& tar xfz /tmp/redis.tar.gz \

&& rm -r /tmp/redis.tar.gz \

&& mkdir -p /usr/src/php/ext \

&& mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \

&& docker-php-ext-install redis \

&& rm -rf /usr/src/php

COPY ./install-composer.sh /
COPY ./php.ini /usr/local/etc/php/
COPY ./www.conf /usr/local/etc/php-fpm.d/

RUN apt-get purge -y g++ \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
    && rm -rf /tmp/*
#    && sh /install-composer.sh \
#    && rm /install-composer.sh

RUN usermod -u 1000 www-data

VOLUME /root/.composer

EXPOSE 9000
CMD ["php-fpm"]