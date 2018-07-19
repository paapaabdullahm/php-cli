FROM pam79/php-fpm
LABEL maintainer="Abdullah Morgan paapaabdullahm@gmail.com"

# Add Composer
RUN apt update; apt install -y curl git openssh-server openssl bash; \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === \
        '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') \
        { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; php -r "unlink('composer-setup.php');"; mv composer.phar /usr/bin/composer; \
    #
    # Add PHPUnit
    wget https://phar.phpunit.de/phpunit-7.2.7.phar; wget https://phar.phpunit.de/dbunit.phar; \
    chmod +x phpunit-7.2.7.phar; mv phpunit-7.2.7.phar /usr/bin/phpunit; \
    mkdir -p /tools/phpunit.d; mv dbunit.phar /tools/phpunit.d/dbunit;

WORKDIR /src
VOLUME ["/src", "/tools/phpunit.d"]
CMD ["/bin/bash"]
