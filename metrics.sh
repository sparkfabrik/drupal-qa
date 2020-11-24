#!/bin/sh
composer install --prefer-dist
vendor/bin/phpqa --ignoredFiles "*\\\.css,*\\\.md,*\\\.txt,*\\\.info,*\\\.yml,settings.php" \
  --report \
  --buildDir "/app/reports" \
  $@
