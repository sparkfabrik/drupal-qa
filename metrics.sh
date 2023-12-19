#!/bin/sh

ARGS=''
IGNORED_DIRS_AS_ARG=false
DEFAULT_IGNORED_DIRS="drupal/vendor"

# Parse phpqa options and merge data with some predefined values.
while [ "$#" -gt 0 ]; do
  case $1 in
  --ignoredDirs)
    ARGS="${ARGS} $1 $2,${DEFAULT_IGNORED_DIRS}"
    IGNORED_DIRS_AS_ARG=true
    ;;
  *)
    ARGS="${ARGS} $1 $2"
    ;;
  esac
  shift
  shift
done

# Set default ignored dirs to vendor directory.
if ! ${IGNORED_DIRS_AS_ARG}; then
  ARGS="${ARGS} --ignoredDirs ${DEFAULT_IGNORED_DIRS}";
fi

# shellcheck disable=SC2086
vendor/bin/phpqa ${ARGS}
