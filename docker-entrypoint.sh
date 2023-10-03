#!/bin/bash
set +e

/usr/bin/envsubst '$$SERVER_A $$SERVER_B' </etc/nginx/conf.d/server.conf.template >/etc/nginx/conf.d/server.conf
cp /usr/local/openresty/nginx/conf/nginx.conf.template /usr/local/openresty/nginx/conf/nginx.conf

exec "$@"
