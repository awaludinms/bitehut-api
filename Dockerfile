FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...
RUN install-php-extensions \
	pdo_mysql \
	gd \
	intl \
	zip \
	opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install --no-dev --no-scripts --no-autoloader --prefer-dist


COPY . /app

RUN composer dump-autoload --optimize
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache

# CMD ["ls"]

# ENTRYPOINT "/app/start.sh"

CMD ["php", "artisan", "octane:frankenphp"]