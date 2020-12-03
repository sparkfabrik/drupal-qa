# Drupal QA tools
This project provides a ready-to-use image to check Drupal metrics.
It uses *edgedesign/phpqa* as main tool to run others metrics tools.
It also provides phpstan libraries focussed on Drupal.

This is the list of tools installed:
- squizlabs/php_codesniffer
- sebastian/phpcpd
- sensiolabs/security-checker
- drupal/coder
- php-parallel-lint/php-parallel-lint
- nette/neon
- edgedesign/phpqa
- mglaman/phpstan-drupal
- phpstan/phpstan-deprecation-rules

There are also some configurations provided for phpqa, phpmd and phpstan tools.

## How to use it
### In your pipeline:
Run this command in your Drupal root folder:

    docker run --rm -v ${PWD}:/app/drupal -v ${PWD}/reports:/app/reports \
    sparkdrupal-qa:latest phpqa \
    --analyzedDirs "drupal/web/modules/custom,drupal/web/themes" \
    --tools "phpcpd:0,phpcs:0,phpmd:0,phpmetrics,phploc,pdepend,parallel-lint:0,security-checker:0,phpstan:0"
This command will mount your drupal project folder in */app/drupal* and a report
folder in */app/reports*.
The option `--analyzedDirs` indicates which folders to scan. In normal
circumstances you are required to scan only custom code. In the example above
I'm telling the tool to scan only custom modules and all themes.
Please also note that the passed directories are relative to the container
filesystem (__"drupal/web/modules/custom"__).
*drupal* is the folder containing all your drupal project (which also should
contains the composer.lock of your project used to scan security issues).
*web* is the folder that contains the Drupal root folder.

The option `--tools` indicates which tools to run.
More info here: https://github.com/EdgedesignCZ/phpqa/blob/master/README.md