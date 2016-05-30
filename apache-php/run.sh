#!/bin/bash

CURRENT=$(cd $(dirname $0) && pwd)

docker run \
       -d \
       -p 80:80 \
       -v ${CURRENT}/public:/var/www/html \
       php:apache
