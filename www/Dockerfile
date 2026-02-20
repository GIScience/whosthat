FROM php:8.4-apache

RUN apt update
RUN apt install -y libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql

COPY whosthat.php /var/www/html/index.php

ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

RUN echo "<?php" >> config.php
RUN echo "const DB_HOST = '${DB_HOST}';" >> config.php
RUN echo "const DB_PORT = '${DB_PORT}';" >> config.php
RUN echo "const DB_DATABASE = '${DB_NAME}';" >> config.php
RUN echo "const DB_USER = '${DB_USER}';" >> config.php
RUN echo "const DB_PASSWORD = '${DB_PASSWORD}';" >> config.php
RUN echo "?>" >> config.php

