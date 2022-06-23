.PHONY: all build_image tests

CUSTOM_PHP_IMAGE := local-drupal-qa

all: build_image tests

build_image:
	docker build -t $(CUSTOM_PHP_IMAGE) .

tests:
	docker run --rm -v ${PWD}/tests:/app/drupal -v ${PWD}/reports:/app/reports $(CUSTOM_PHP_IMAGE) phpqa --analyzedDirs "drupal/web/modules" --tools "phpcpd:0,phpcs:0,phpmd:0,phpmetrics,phploc,pdepend,parallel-lint:0,phpstan:0,security-checker:0" --buildDir "/app/reports" || true
	make check-diffs

check-diffs:
	diff tests/expected_reports/checkstyle.xml reports/checkstyle.xml
	diff tests/expected_reports/phpcpd.xml reports/phpcpd.xml
	diff -I '\<pmd version=.*timestamp=.*\>' tests/expected_reports/phpmd.xml reports/phpmd.xml
	diff tests/expected_reports/phpstan.xml reports/phpstan.xml
	diff tests/expected_reports/security-checker.html reports/security-checker.html
