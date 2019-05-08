#!/usr/bin/env bash

# set -x

# echo "arg 1 $1"

INDEX_HTML=/usr/share/nginx/html/index.html

if [ -n "$1" ]
then
    exec "$@"
fi

# apply environment variables to default.conf
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
