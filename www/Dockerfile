FROM php:8.4-apache

RUN apt update
RUN apt install -y libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql

COPY whosthat.php /var/www/html/index.php
COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
