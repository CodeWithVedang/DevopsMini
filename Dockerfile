# Use official PHP Apache image
FROM php:8.1-apache
# Install MySQLi extension
RUN docker-php-ext-install mysqli
# Enable Apache rewrite module
RUN a2enmod rewrite
# Set working directory
WORKDIR /var/www/html
# Copy project files
COPY . .
# Set permissions
RUN chown -R www-data:www-data /var/www/html
# Expose port 80
EXPOSE 80
# Start Apache
CMD ["apache2-foreground"]