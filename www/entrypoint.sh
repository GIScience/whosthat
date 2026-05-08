#!/usr/bin/env bash

set -e

echo "<?php
const DB_HOST = '$DB_HOST';
const DB_PORT = '$DB_PORT';
const DB_DATABASE = '$DB_NAME';
const DB_USER = '$DB_USER';
const DB_PASSWORD = '$DB_PASSWORD';
?>" > /var/www/html/config.php

exec apache2-foreground "$@"
