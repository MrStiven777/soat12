# Escoge una imagen base con PHP y Hack (o PHP + extensiones)
FROM php:8.1-cli

# O si necesitas usar HHVM para Hack, puedes usar una imagen HHVM:
# FROM hhvm/hhvm:latest

WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Si usas Composer para administrar dependencias PHP:
# Instalar Composer
RUN apt-get update && \
    apt-get install -y unzip git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Instalar dependencias PHP
RUN if [ -f composer.json ]; then composer install --no-dev --optimize-autoloader; fi

# Exponer puerto (ajústalo si tu app corre en otro puerto)
EXPOSE 8000

# Comando de entrada: cambia según cómo arranque tu aplicación
# Por ejemplo, usando el servidor interno de PHP:
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
