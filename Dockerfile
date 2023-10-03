FROM openresty/openresty:1.21.4.1-0-bullseye-fat

COPY conf /etc/nginx/conf.d
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY lua-scripts /etc/nginx/lua-scripts
COPY nginx.conf.template /usr/local/openresty/nginx/conf/nginx.conf.template

EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "/usr/local/bin/docker-entrypoint.sh" ]
