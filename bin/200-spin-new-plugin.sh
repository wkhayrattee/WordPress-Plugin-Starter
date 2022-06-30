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
## Rename keys in file: readme.txt
#
if [ -e "$PLUGIN_DIR/readme.txt" ]; then
  printf "[info] Scanning inside file readme.txt \n\\n"

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

  printf "[info] Renamed key:  {{PROJECT_SLUG}}\n"
else
    printf "[error] Cannot find file readme.txt at: %s" "$PLUGIN_DIR"
    exit
fi
