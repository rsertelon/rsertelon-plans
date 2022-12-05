# Core origin package copies

This file lists all packages that exist in core but where duplicated here because they lacked something, either temporarily, or permanently.

## Core packages that could be changed (and remove the need for duplication here)

### core/boost

* must use core/python

### core/mysql-client

* must use version >= 8

## Core packages that are "too much customized"

### core/php-fpm

* for our own configuration;
* must use rsertelon/php.

### core/postfix

* for our own configuration;
* for using mysql.