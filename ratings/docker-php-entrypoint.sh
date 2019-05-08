#!/bin/sh
set -e

if [ -f /usr/local/etc/php/conf.d/newrelic.ini ]; then
	# configure New Relic PHP agent
	sed -i -e "s/NEW_RELIC_LICENSE_KEY/${NEW_RELIC_LICENSE_KEY}/g" /usr/local/etc/php/conf.d/newrelic.ini
	sed -i -e "s/NEW_RELIC_APP_NAME/${NEW_RELIC_APP_NAME}/g" /usr/local/etc/php/conf.d/newrelic.ini
	sed -i -e "s/NEW_RELIC_DISTRIBUTED_TRACING_ENABLED/${NEW_RELIC_DISTRIBUTED_TRACING_ENABLED}/g" /usr/local/etc/php/conf.d/newrelic.ini
	sed -i -e "s/NEW_RELIC_LABELS/${NEW_RELIC_LABELS}/g" /usr/local/etc/php/conf.d/newrelic.ini
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

exec "$@"
