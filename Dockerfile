# FROM node:14.21.2-buster-slim
FROM richarvey/nginx-php-fpm:2.1.2

RUN apk update && apk add nodejs=14.20.1-r0 npm=7.17.0-r0 --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/main
# RUN apk update && apk add nodejs=14.21.2s npm=6.14.17 --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/main

# RUN apk add --update nodejs=14.21.2 npm

COPY . .

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]