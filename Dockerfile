FROM php:8.1-cli

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y unzip git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN if [ -f composer.json ]; then composer install --no-dev --optimize-autoloader; fi

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "digital"]
