#!/bin/bash

# @file tools/travis/install-composer-dependencies.sh
#
# Copyright (c) 2014-2020 Simon Fraser University
# Copyright (c) 2010-2020 John Willinsky
# Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
#
# Script to install the Composer dependencies.
#

set -xe

# Search for composer.json files, and run Composer to install the dependencies.
find . -maxdepth 4 -name composer.json -exec bash -c 'composer --working-dir="`dirname {}`" install' ";"
