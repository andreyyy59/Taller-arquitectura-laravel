#!/bin/bash

appKey=$(awk -F= '$1 == "APP_KEY" {print $2}' .env)

if [ -z "$appKey" ]; then
  php artisan key:generate
fi

php artisan config:cache

databaseConnection=$(php artisan tinker --execute="echo config('database.default')")
databaseHost=$(php artisan tinker --execute="echo config('database.connections.' . $databaseConnection . '.host')")
databasePort=$(php artisan tinker --execute="echo config('database.connections.' . $databaseConnection . '.port')")

./docker/wait-for-it.sh $databaseHost:$databasePort -t 90 -- php artisan migrate --force --seed

supervisord -n -c docker/supervisord.conf

exec "$@"
