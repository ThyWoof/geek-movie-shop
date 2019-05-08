#!/bin/sh
IFS=$'\n'
for VAR in $(egrep '^.+=' ./.env)
do
    export $VAR
done