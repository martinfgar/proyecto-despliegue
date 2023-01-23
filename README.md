# Despliegue

1. Lanzar el docker-compose:
   ```
    docker compose up -d
   ```
2. Si queremos crear el esquema de la base de datos (usamos la BD que se crea con el docker compose):
   ```
    docker exec -it laravel-api sh -c "php artisan migrate && php artisan passport:install"
   ```
3. Si queremos poblar la base de datos con empresas y datos previos de hasta hace 1 año, ejecutamos:
   ```
   docker exec -it data-creator sh -c "php artisan db:seed"
   ```