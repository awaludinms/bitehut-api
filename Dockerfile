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

COPY . /app

# CMD ["ls"]

# ENTRYPOINT "/app/start.sh"

CMD ["php", "artisan", "octane:frankenphp"]