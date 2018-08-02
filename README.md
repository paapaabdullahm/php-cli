## **PHP-CLI with Composer and PHPUnit**

PHP CLI is the command-line interface for PHP. The main focus of CLI Server API is for developing shell applications with PHP. There are quite a few differences between the CLI SAPI and other SAPIs. It is worth mentioning that PHP CLI and PHP FPM are different SAPIs although they do share many of the same behaviors.

* #### Current Tags:

  - PHP (CLI): **`7.2.8`**
  - PHPUnit:  **`7.2.7`**
  - Composer: **`1.6.0`**

* #### Add Functions via .bashrc or .zshrc

    ```bash
    php() { docker run --rm -it -w /src -v "$(pwd)":/src  pam79/php-cli php "$@"; }
    phpunit() { docker run --rm -it -w /src -v "$(pwd)":/src  pam79/php-cli phpunit "$@"; }
    composer() { docker run --rm -it -w /src -v "$(pwd)":/src  pam79/php-cli composer "$@"; }
    ```
&nbsp;

* #### Source file to apply changes

    ```bash
    $ source ~/.bashrc
    ```
&nbsp;

## **USAGE**

## Composer

Composer is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Checkout [**project site**](https://getcomposer.org/) for more details.

The shortcut function created earlier can be used as a normal composer binary:
```bash
$ composer --version
$ composer install --no-dev
```
&nbsp;

## PHPUnit With dbunit

A Programmer-Oriented Testing Framework for PHP. An instance of the xUnit architecture for unit testing frameworks. Checkout the [**Getting Started with PHPUnit**](https://phpunit.de/getting-started.html) page on the project website for a quick intro. Check the documentation on the [__7.x__](https://phpunit.readthedocs.io/en/7.1/) release.

* #### Test that the previous function works
    ```bash
    $ phpunit --version
    $ phpunit --help
    ```
    &nbsp;

* #### Example file defining test suites

    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:noNamespaceSchemaLocation="https://schema.phpunit.de/7.2/phpunit.xsd"
             extensionsDirectory="/tools/phpunit.d"
             backupGlobals="false"
             backupStaticAttributes="false"
             bootstrap="bootstrap/autoload.php"
             colors="true"
             convertErrorsToExceptions="true"
             convertNoticesToExceptions="true"
             convertWarningsToExceptions="true"
             processIsolation="false"
             stopOnFailure="false">
        <testsuites>
            <testsuite name="Modules Test">
                <directory suffix="Test.php">./src/Modules</directory>
            </testsuite>
        </testsuites>
        <filter>
            <whitelist processUncoveredFilesFromWhitelist="true">
                <directory suffix=".php">./src</directory>
            </whitelist>
        </filter>
        <php>
            <env name="API_FULL_URL"        value="http://example.dev"/>
    
            <env name="APP_ENV"             value="testing"/>
            <env name="CACHE_DRIVER"        value="array"/>
            <env name="SESSION_DRIVER"      value="array"/>
            <env name="QUEUE_DRIVER"        value="sync"/>
    
            <env name="DB_CONNECTION"       value="mariadb"/>
            <env name="DB_HOST"             value="localhost"/>
            <env name="DB_PORT"             value="3306"/>
            <env name="DB_NAME"             value="example_db"/>
            <env name="DB_USERNAME"         value="example_user"/>
            <env name="DB_PASSWORD"         value="example_secret"/>
        </php>
    </phpunit>
    ```
    &nbsp;

* #### Use phpunit to run the above testsuite

    ```bash
    $ phpunit --testsuite "Modules Test"
    ```
