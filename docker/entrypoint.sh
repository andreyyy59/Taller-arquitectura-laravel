#!/bin/bash

appKey=$(awk -F= '$1 == "APP_KEY" {print $2}' .env)

if [ -z "$appKey" ]; then
  php artisan key:generate
fi

php artisan config:cache

databaseHost=${DB_HOST:-127.0.0.1}
databasePort=${DB_PORT:-3306}

./docker/wait-for-it.sh $databaseHost:$databasePort -t 90 -- php artisan migrate --force --seed

supervisord -n -c docker/supervisord.conf

exec "$@"
