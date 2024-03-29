FROM php:7.2-fpm

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

RUN docker-php-ext-install zip intl mbstring pdo_mysql exif \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

    #添加扩展的其中一种方式 就是把命令组合在了一起
RUN curl -fsSL 'https://pecl.php.net//get/redis-4.0.2.tgz' -o redis-4.0.2.tar.gz \
    && tar -xvf redis-4.0.2.tar.gz \
    && rm redis-4.0.2.tar.gz \
    && ( \
        cd redis-4.0.2 \
        && phpize \
        && ./configure  \
        && make \
        && make install \
    ) \
    && rm -r redis-4.0.2 \ 
    && docker-php-ext-enable redis  

COPY ./install-composer.sh /
COPY ./php.ini /usr/local/etc/php/
COPY ./www.conf /usr/local/etc/php/

RUN apt-get purge -y g++ \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && sh /install-composer.sh \
    && rm /install-composer.sh

RUN usermod -u 1000 www-data

VOLUME /root/.composer

EXPOSE 9000
CMD ["php-fpm"]
