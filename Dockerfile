FROM php:7.0-apache


ARG generatedata_version=3.2.4

LABEL Description="This image starts generatedata" Vendor="computerlyrik" Version="${generatedata_version}"

RUN docker-php-ext-install mysqli


ADD https://github.com/benkeen/generatedata/archive/${generatedata_version}.tar.gz /generatedata.tar.gz
RUN tar xzf /generatedata.tar.gz -C /var/www/html/
RUN chown -R www-data /var/www/html 

# RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html/generatedata-${generatedata_version}

RUN composer install
