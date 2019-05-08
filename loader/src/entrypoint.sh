#!/bin/sh

if [ -z $CLIENTS]
then
  CLIENTS=1
fi

locust -f loader.py --host "$HOST" --no-web -c $CLIENTS -r 1
