#!/usr/bin/env bash
##
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
##
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/header.sh

printf '[info] creating new folder with the plugin slug provided in plugin-env file.\n'
## copy folder template, first make sure output dir is empty
rm -rf $ROOT_DIR/template $ROOT_DIR/output/*
cp -rf $ROOT_DIR/template $ROOT_DIR/output/$PROJECT_SLUG
## check if copy was successful - should have a new folder named as the plugin's slug
if [ -d "$ROOT_DIR/output/$PROJECT_SLUG" ]; then
  printf "[info] Folder with plugin slug $PROJECT_SLUG created. Proceeding further..\n"
else
    printf "NOT OK plugins"
    exit
fi

