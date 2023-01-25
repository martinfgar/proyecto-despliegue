# Despliegue

1. Renombrar y configurar el fichero .env

2. Lanzar el docker-compose:
   ```
    docker compose up -d
   ```
3. Lanzar la creación de tablas y codigos oauth:
   ```
   docker exec -it laravel-api sh -c "php artisan migrate && php artisan passport:install"
   ```
4. Si queremos poblar la base de datos con empresas y datos previos de hasta hace 1 año, ejecutamos:
   ```
   docker exec -it data-creator sh -c "php artisan db:seed"
   ```