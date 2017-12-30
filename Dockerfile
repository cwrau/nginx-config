FROM nginx:alpine
LABEL maintainer="cwrau@cwrcoding.com"

COPY sites-available /etc/nginx/sites-available
COPY static_config /etc/nginx/static_config
COPY sites-enabled/* /etc/nginx/conf.d/
COPY default_config/* /etc/nginx/conf.d/

EXPOSE 80 443
