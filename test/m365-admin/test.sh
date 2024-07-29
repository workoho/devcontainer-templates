#!/bin/bash

cd "$(dirname "$0")" || exit 1

# shellcheck source=/dev/null
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c

# Report result
reportResults
