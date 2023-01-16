FROM php:8.1-cli


ARG DB_HOST
ARG DB_PORT
ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update && apt-get -y install cron
RUN apt install unzip -y
ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir /project
WORKDIR /project
COPY . /project
RUN touch cron.log
COPY ./crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN ["mv",".env.example",".env"]
RUN echo "DB_DATABASE=${DB_DATABASE}" >> .env
RUN echo "DB_HOST=${DB_HOST}" >> .env
RUN echo "DB_PORT=${DB_PORT}" >> .env
RUN echo "DB_USERNAME=${DB_USERNAME}" >> .env
RUN echo "DB_PASSWORD=${DB_PASSWORD}" >> .env
RUN composer install && php artisan key:generate 
RUN chmod o+w ./storage/ -R
RUN /usr/bin/crontab /etc/cron.d/crontab
