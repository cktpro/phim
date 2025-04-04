# Dùng image WordPress với PHP 7
FROM wordpress:php7.4-apache

# Cài đặt ionCube
RUN apt-get update && apt-get install -y \
    libzip-dev \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvzf ioncube_loaders_lin_x86-64.tar.gz \ 
    && cp ioncube/ioncube_loader_lin_7.4.so /usr/local/lib/php/extensions/no-debug-non-zts-20190902 \
    && echo "zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20190902/ioncube_loader_lin_7.4.so" > /usr/local/etc/php/php.ini-production 
# Clean up
COPY  php.ini  /usr/local/etc/php
RUN rm -rf ioncube ioncube_loaders_lin_x86-64.tar.gz
