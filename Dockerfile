FROM php:7.0-apache


ARG generatedata_version=3.2.4

LABEL Description="This image starts generatedata" Vendor="computerlyrik" Version="${generatedata_version}"

ADD https://github.com/benkeen/generatedata/archive/${generatedata_version}.tar.gz /generatedata.tar.gz
RUN tar -x generatedata.tar.gz /var/www/html/

RUN	a2enmod rewrite

RUN composer install
