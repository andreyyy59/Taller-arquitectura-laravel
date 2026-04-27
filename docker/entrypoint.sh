#!/bin/bash
echo "Starting entrypoint script..."

# Clear any cached configuration to ensure we read from environment variables
php artisan config:clear
php artisan cache:clear

appKey=$(grep "APP_KEY=" .env | cut -d'=' -f2)

if [ -z "$appKey" ] || [ "$appKey" = "" ]; then
  echo "Generating APP_KEY..."
  php artisan key:generate
fi

databaseHost=${DB_HOST:-127.0.0.1}
databasePort=${DB_PORT:-5432}

echo "Waiting for database at $databaseHost:$databasePort..."
./docker/wait-for-it.sh $databaseHost:$databasePort -t 90

echo "Running migrations..."
php artisan migrate --force --no-interaction

echo "Checking migration status..."
php artisan migrate:status

echo "Running seeders..."
php artisan db:seed --force --no-interaction

echo "Starting supervisord..."
supervisord -n -c docker/supervisord.conf

exec "$@"
