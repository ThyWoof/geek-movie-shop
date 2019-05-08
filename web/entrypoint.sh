#!/usr/bin/env bash

# set -x

# echo "arg 1 $1"

INDEX_HTML=/usr/share/nginx/html/index.html

if [ -n "$1" ]
then
    exec "$@"
fi

if [ -n "$NEW_RELIC_BROWSER_LICENSE_KEY" ]
then
    echo "Enabling New Relic Browser agent"
    sed -i -e "s/NEW_RELIC_BROWSER_LICENSE_KEY/${NEW_RELIC_BROWSER_LICENSE_KEY}/g" ${INDEX_HTML}
    sed -i -e "s/NEW_RELIC_BROWSER_APPLICATION_ID/${NEW_RELIC_BROWSER_APPLICATION_ID}/g" ${INDEX_HTML}
fi

# apply environment variables to default.conf
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
