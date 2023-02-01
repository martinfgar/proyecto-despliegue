#!/bin/sh

./wait-for-it.sh db:3306 -- php artisan migrate --seed && php artisan passport:install
apache2-foreground