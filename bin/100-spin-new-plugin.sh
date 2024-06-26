#!/usr/bin/env bash
##
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
##
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/header.sh

printf '[info] Creating new folder with the plugin slug provided in plugin-env file.\n\n'
#
## copy folder template, first make sure output dir is empty
#
rm -rf $ROOT_DIR/output/*
cp -rf $ROOT_DIR/template $PLUGIN_DIR
#
## check if copy was successful - should have a new folder named as the plugin's slug
#
if [ -d "$PLUGIN_DIR" ]; then
  printf "[info] Folder with plugin slug $PROJECT_SLUG created in output folder\n\n"
  printf "[info] Proceeding further..\n"
else
    printf "[error] NOT OK the previous copy did not seem to have worked"
    printf "[error] Cannot find plugin at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename template.php as {slug}.php
#
if [ -e "$PLUGIN_DIR/template.php" ]; then
  mv $PLUGIN_DIR/template.php "$PLUGIN_DIR/$PROJECT_SLUG.php"
  printf "[info] Renamed templated.php to $PROJECT_SLUG.php. \n\n"
else
    printf "[error] Cannot find template.php at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename template_plugin_helper.php as {slug}_plugin_helper.php
#
if [ -e "$PLUGIN_DIR/src/template_plugin_helper.php" ]; then
  mv $PLUGIN_DIR/src/template_plugin_helper.php "$PLUGIN_DIR/src/${PROJECT_SLUG}_plugin_helper.php"
  printf "[info] Renamed templated.php to ${PROJECT_SLUG}_plugin_helper.php \n\n"
else
    printf "[error] Cannot find template_plugin_helper.php at: %s" "$PLUGIN_DIR/src"
    exit
fi
#
## Rename template.js as {slug}.js
#
if [ -e "$PLUGIN_DIR/assets/js/template.js" ]; then
  mv $PLUGIN_DIR/assets/js/template.js "$PLUGIN_DIR/assets/js/$PROJECT_SLUG.js"
  printf "[info] Renamed js file templated.js to $PROJECT_SLUG.js. \n\n"
else
    printf "[error] Cannot find js file template.js at: %s" "$PLUGIN_DIR/assets/js/"
    exit
fi
#
## Rename template.css as {slug}.css
#
if [ -e "$PLUGIN_DIR/assets/css/template.css" ]; then
  mv $PLUGIN_DIR/assets/css/template.css "$PLUGIN_DIR/assets/css/$PROJECT_SLUG.css"
  printf "[info] Renamed js file templated.css to $PROJECT_SLUG.css. \n\n"
else
    printf "[error] Cannot find js file template.css at: %s" "$PLUGIN_DIR/assets/css/"
    exit
fi
#
## Rename keys in file: readme.txt
#
if [ -e "$PLUGIN_DIR/readme.txt" ]; then
  printf "[info] Scanning inside file readme.txt \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%AUTHOR_NAME%|$AUTHOR_NAME|g; \
   s|%WP_MINIMUM_VERSION%|$WP_MINIMUM_VERSION|g; \
   s|%WP_TESTED_UPTO_VERSION%|$WP_TESTED_UPTO_VERSION|g; \
   s|%LICENCE%|$LICENCE|g; \
   s|%LICENCE_URI%|$LICENCE_URI|g; \
   s|%PROJECT_GITHUB%|$PROJECT_GITHUB|g; \
  " \
  "$PLUGIN_DIR/readme.txt"

  printf "[info] Renamed all keys for:  readme.txt\n\n"
else
    printf "[error] Cannot find file readme.txt at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: README.md
#
if [ -e "$PLUGIN_DIR/README.md" ]; then
  printf "[info] Scanning inside file README.md \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PROJECT_NAME%|$PROJECT_NAME|g; \
   s|%AUTHOR_NAME%|$AUTHOR_NAME|g; \
   s|%AUTHOR_WP_ORG_USERNAME%|$AUTHOR_WP_ORG_USERNAME|g; \
   s|%WP_MINIMUM_VERSION%|$WP_MINIMUM_VERSION|g; \
   s|%WP_TESTED_UPTO_VERSION%|$WP_TESTED_UPTO_VERSION|g; \
   s|%LICENCE%|$LICENCE|g; \
   s|%LICENCE_URI%|$LICENCE_URI|g; \
   s|%PROJECT_GITHUB%|$PROJECT_GITHUB|g; \
  " \
  "$PLUGIN_DIR/README.md"

  printf "[info] Renamed all keys for:  README.md\n\n"
else
    printf "[error] Cannot find file README.md at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: template.php
#
TEMPLATE_PHP_FILE="$PROJECT_SLUG.php"
if [ -e "$PLUGIN_DIR/$TEMPLATE_PHP_FILE" ]; then
  printf "[info] Scanning inside file $TEMPLATE_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PROJECT_NAME%|$PROJECT_NAME|g; \
   s|%AUTHOR_NAME%|$AUTHOR_NAME|g; \
   s|%AUTHOR_URI%|$AUTHOR_URI|g; \
   s|%WP_MINIMUM_VERSION%|$WP_MINIMUM_VERSION|g; \
   s|%LICENCE%|$LICENCE|g; \
   s|%LICENCE_URI%|$LICENCE_URI|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
  " \
  "$PLUGIN_DIR/$TEMPLATE_PHP_FILE"

  printf "[info] Renamed all keys for:  $TEMPLATE_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $TEMPLATE_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: uninstall.php
#
UNINSTALL_PHP_FILE="uninstall.php"
if [ -e "$PLUGIN_DIR/$UNINSTALL_PHP_FILE" ]; then
  printf "[info] Scanning inside file $UNINSTALL_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
  " \
  "$PLUGIN_DIR/$UNINSTALL_PHP_FILE"

  printf "[info] Renamed all keys for:  $UNINSTALL_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $UNINSTALL_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: composer.json
#
COMPOSER_JSON_FILE="composer.json"
if [ -e "$PLUGIN_DIR/$COMPOSER_JSON_FILE" ]; then
  printf "[info] Scanning inside file $COMPOSER_JSON_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%COMPOSER_NAMESPACE%|$COMPOSER_NAMESPACE|g; \
   s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
   s|%AUTHOR_NAME%|$AUTHOR_NAME|g; \
   s|%AUTHOR_EMAIL%|$AUTHOR_EMAIL|g; \
   s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%LICENCE%|$LICENCE|g; \
  " \
  "$PLUGIN_DIR/$COMPOSER_JSON_FILE"

  printf "[info] Renamed all keys for:  $COMPOSER_JSON_FILE\n\n"
else
    printf "[error] Cannot find file $COMPOSER_JSON_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: Enum.php
#
ENUM_PHP_FILE="Enum.php"
if [ -e "$PLUGIN_DIR/src/Core/$ENUM_PHP_FILE" ]; then
  printf "[info] Scanning inside file $ENUM_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
  " \
  "$PLUGIN_DIR/src/Core/$ENUM_PHP_FILE"

  printf "[info] Renamed all keys for:  $ENUM_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $ENUM_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: PluginManager.php
#
PLUGINMANAGER_PHP_FILE="PluginManager.php"
if [ -e "$PLUGIN_DIR/src/Core/$PLUGINMANAGER_PHP_FILE" ]; then
  printf "[info] Scanning inside file $PLUGINMANAGER_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
  " \
  "$PLUGIN_DIR/src/Core/$PLUGINMANAGER_PHP_FILE"

  printf "[info] Renamed all keys for:  $PLUGINMANAGER_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $PLUGINMANAGER_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: Utils.php
#
UTILS_PHP_FILE="Utils.php"
if [ -e "$PLUGIN_DIR/src/Core/$UTILS_PHP_FILE" ]; then
  printf "[info] Scanning inside file $UTILS_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
  " \
  "$PLUGIN_DIR/src/Core/$UTILS_PHP_FILE"

  printf "[info] Renamed all keys for:  $UTILS_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $UTILS_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: Dashboard.php
#
ADMIN_DASHBORD_PHP_FILE="Dashboard.php"
if [ -e "$PLUGIN_DIR/src/Core/Admin/$ADMIN_DASHBORD_PHP_FILE" ]; then
  printf "[info] Scanning inside file $ADMIN_DASHBORD_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PROJECT_SLUG%|$PROJECT_SLUG|g; \
   s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
  " \
  "$PLUGIN_DIR/src/Core/Admin/$ADMIN_DASHBORD_PHP_FILE"

  printf "[info] Renamed all keys for:  $ADMIN_DASHBORD_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $ADMIN_DASHBORD_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: HomePage.php
#
ADMIN_HOMEPAGE_PHP_FILE="HomePage.php"
if [ -e "$PLUGIN_DIR/src/Core/Admin/$ADMIN_HOMEPAGE_PHP_FILE" ]; then
  printf "[info] Scanning inside file $ADMIN_HOMEPAGE_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
  s|%PROJECT_NAME%|$PROJECT_NAME|g; \
  s|%PROJECT_MENU_ICON%|$PROJECT_MENU_ICON|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
  " \
  "$PLUGIN_DIR/src/Core/Admin/$ADMIN_HOMEPAGE_PHP_FILE"

  printf "[info] Renamed all keys for:  $ADMIN_HOMEPAGE_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $ADMIN_HOMEPAGE_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: LogPage.php
#
ADMIN_LOGPAGE_PHP_FILE="LogPage.php"
if [ -e "$PLUGIN_DIR/src/Core/Admin/$ADMIN_LOGPAGE_PHP_FILE" ]; then
  printf "[info] Scanning inside file $ADMIN_LOGPAGE_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
  "s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
   s|%PHP_CONSTANT_PREFIX%|$PHP_CONSTANT_PREFIX|g; \
  " \
  "$PLUGIN_DIR/src/Core/Admin/$ADMIN_LOGPAGE_PHP_FILE"

  printf "[info] Renamed all keys for:  $ADMIN_LOGPAGE_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $ADMIN_LOGPAGE_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## Rename keys in file: log-tpl.php
#
ADMIN_LOG_TPL_PHP_FILE="log-tpl.php"
if [ -e "$PLUGIN_DIR/templates/admin/$ADMIN_LOG_TPL_PHP_FILE" ]; then
  printf "[info] Scanning inside file $ADMIN_LOG_TPL_PHP_FILE \n"

  sed $PORTABLE_SED_OPTION \
   "s|%PSR4_NAMESPACE%|$PSR4_NAMESPACE|g; \
  " \
  "$PLUGIN_DIR/templates/admin/$ADMIN_LOG_TPL_PHP_FILE"

  printf "[info] Renamed all keys for:  $ADMIN_LOG_TPL_PHP_FILE\n\n"
else
    printf "[error] Cannot find file $ADMIN_LOG_TPL_PHP_FILE at: %s" "$PLUGIN_DIR"
    exit
fi
#
## finally we remove all .remove files if on MAC
#
if [ "$IS_MAC_OS" = "YES"  ]; then
  printf "[info] Removing all .remove files since we are on Mac \n"
  find $PLUGIN_DIR \( -type f -name '*.remove' \) -delete
fi
#
##
#
printf "[info] All done!\n"
