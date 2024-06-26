#!/usr/bin/env bash
##
### A central place to add all reusable stuffs
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
### @license GPL-3.0-only
##
AUTHOR_NAME="Wasseem Khayrattee"
AUTHOR_WP_ORG_USERNAME="wkhayrattee"
AUTHOR_EMAIL="github@wk.contact"
AUTHOR_URI="https://github.com/wkhayrattee"
### should be in a valid slug
PROJECT_SLUG="my-custom-plugin-name"
PROJECT_NAME="My Custom Plugin Name"
PROJECT_GITHUB="todo_github_url"
##
### Dashicons is the official icon font of the WordPress admin as of 3.8
### To choose an icon, see: https://developer.wordpress.org/resource/dashicons/
### To use an icon, add the class `dashicons-{icon-name}` to an HTML element.
##
PROJECT_MENU_ICON="dashicons-admin-generic"
##
### According to the Composer docs, the naming convention for a Composer namespace is as follows:
### - must be lowercase
### - must consist of words separated by -, ., or _
### - must match the regular expression: ^a-z0-9: [_. -]?[a-z0-9]+*/a-z0-9: ([_.] |-{1,2}?[a-z0-9]+)*$
### Reference: https://getcomposer.org/doc/04-schema.md#name
##
COMPOSER_NAMESPACE="wkhayrattee"
## Should be CamelCase
PSR4_NAMESPACE="MyCustomPlugin"
PHP_CONSTANT_PREFIX="MY_CUSTOM_PLUGIN"
## to house handy procedural functions
HELPER_FILE_NAME="${PROJECT_SLUG}-plugin-helper"
#
LICENCE="GPL-3.0-only"
LICENCE_URI="https://www.gnu.org/licenses/gpl-3.0.html"
#
WP_MINIMUM_VERSION="5.9.3"
WP_TESTED_UPTO_VERSION="6.0"
