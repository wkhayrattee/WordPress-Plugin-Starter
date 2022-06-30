#!/usr/bin/env bash
##
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
##
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/header.sh
#
## Change directory to the newly created plugin dir
#
cd $PLUGIN_DIR
printf '[info] Performing Composer install - optimised version, in verbose mode.\n\n'
#
## performing update, since on a first install, it will by default do install
#
composer update $COMPOSER_DEV $COMPOSER_OPTIMISE --prefer-dist -vv
