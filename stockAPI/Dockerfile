FROM php:8.1-apache 

WORKDIR /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN  apt-get update
RUN apt install unzip -y
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite headers
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www/html
RUN ["mv",".env.example",".env"]
RUN composer install && php artisan key:generate 
RUN chmod o+w ./storage/ -R
# ENTRYPOINT ["/tmp/run.sh"]

# CMD php artisan migrate && php artisan passport:install 