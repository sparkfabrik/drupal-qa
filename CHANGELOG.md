# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.5.0] - 2024-05-21

### Changed

- Relevant dependency upgrades (php runtime is 8.3.7):

```
  - Upgrading phpstan/phpstan (1.10.50 => 1.11.1)
  - Upgrading drupal/coder (8.3.22 => 8.3.24)
  - Upgrading squizlabs/php_codesniffer (3.8.0 => 3.10.0)
  - Upgrading phpstan/phpdoc-parser (1.24.5 => 1.29.0)
  - Upgrading phpstan/phpstan-deprecation-rules (1.1.4 => 1.2.0)
  - Upgrading jangregor/phpstan-prophecy (1.0.0 => 1.0.2)
  - Upgrading mglaman/phpstan-drupal (1.2.4 => 1.2.11)
  - Upgrading php-parallel-lint/php-parallel-lint (v1.3.2 => v1.4.0)
  - Upgrading symfony/polyfill-php80 (v1.28.0 => v1.29.0)
  - Upgrading webflo/drupal-finder (1.2.2 => 1.3.0)
  - Upgrading symfony/deprecation-contracts (v3.4.0 => v3.5.0)
  - Upgrading symfony/yaml (v6.4.0 => v6.4.7)
  - Upgrading slevomat/coding-standard (8.14.1 => 8.15.0)
  - Upgrading sirbrillig/phpcs-variable-analysis (v2.11.17 => v2.11.18)
```

## [2.4.0] - 2023-12-19

### Changed

- Relevant dependency upgrades:

```
  - Upgrading squizlabs/php_codesniffer (3.7.1 => 3.8.0)
  - Upgrading drupal/coder (8.3.15 => 8.3.22)
  - Upgrading sebastian/phpcpd (5.0.2 => 6.0.3)
  - Upgrading phpmetrics/phpmetrics (v2.8.1 => v2.8.2)
  - Upgrading pdepend/pdepend (2.10.3 => 2.16.2)
  - Upgrading phpmd/phpmd (2.12.0 => 2.15.0)
  - Upgrading edgedesign/phpqa (v1.26.1 => dev-master a3038f1)
  - Upgrading phpstan/phpstan (1.10.15 => 1.10.50)
  - Upgrading phpstan/phpstan-deprecation-rules (1.1.3 => 1.1.4)
  - Upgrading mglaman/phpstan-drupal (1.1.34 => 1.2.4)
  - Upgrading vimeo/psalm (4.23.0 => 4.30.0)
```

Users might find useful to upgrade their own `mglaman/phpstan-drupal` dependency to `1.2.4` if they are not already using that version to avoid conflicts.

Upgrade of `drupal/coder` means more `phpcs` errors, most can be auto-fixed via `phpcbf --standard=Drupal`.

PHPCS tool now uses correct custom ruleset file which was previously being ignored, now `DrupalPractice` is correctly included along with our rule overrides.
