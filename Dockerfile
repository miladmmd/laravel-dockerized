FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

# Update package list and install necessary packages
RUN apk update && apk add \
    curl \
    libpng-dev \
    libxml2-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    zip \
    unzip \
    libpq \
    linux-headers \
    build-base

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd sockets
# Copy Composer from the latest composer image
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
