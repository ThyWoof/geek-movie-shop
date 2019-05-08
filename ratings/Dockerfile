# Use composer to install dependencies
FROM composer AS build

COPY composer.json /app/

RUN composer install

#
# Build the app
#
FROM php:7.2-apache

RUN docker-php-ext-install pdo_mysql

# relax permissions on status
COPY status.conf /etc/apache2/mods-available/status.conf
# Enable Apache mod_rewrite and status
RUN a2enmod rewrite && a2enmod status

WORKDIR /var/www/html

# copy dependencies from previous step
COPY --from=build /app/vendor/ /var/www/html/vendor/

# copy application
COPY html/ /var/www/html

# copy custom entrypoint
COPY docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN \
  chmod +x /usr/local/bin/docker-php-entrypoint

# install New Relic PHP agent
RUN \
  apt-get update -y && \
  apt-get install -y gnupg && \
  echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list && \
  curl -Ls https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
  apt-get update -y && \
  apt-get install -y newrelic-php5 && \
  newrelic-install install
COPY newrelic.ini /usr/local/etc/php/conf.d
