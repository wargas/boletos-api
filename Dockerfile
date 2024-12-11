FROM dunglas/frankenphp

ENV SERVER_NAME=:80
ENV COMPOSER_ALLOW_SUPERUSER=1

ENV APP_NAME=boletos-api
ENV APP_ENV=local
ENV APP_DEBUG=true
ENV APP_TIMEZONE=UTC

RUN install-php-extensions pdo_pgsql gd intl zip opcache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

COPY . .

RUN /usr/local/bin/composer install

CMD ["/usr/local/bin/frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]