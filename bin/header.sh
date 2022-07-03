#!/usr/bin/env bash
##
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
##
export DEBIAN_FRONTEND=noninteractive
#
## To add `sed` support on both OSX and Linux
## The ref in (https://stackoverflow.com/a/66763713) did not work
## For a work-around, I am going to just pass a file extension to sed on Mac, which we will delete in the end
#
if [[ "$OSTYPE" == "darwin"* ]]; then
  IS_MAC_OS='YES'
  PORTABLE_SED_OPTION="-i .remove"
else
  IS_MAC_OS='NO'
  PORTABLE_SED_OPTION='-i'
fi;
#
## get current dir path for our main git repo
## this is one-step before folder `bin`
#
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$( cd "$( dirname "$SCRIPT_DIR" )" >/dev/null 2>&1 && pwd )"
#
source $ROOT_DIR/plugin-env.sh
source $BIN_DIR/env.sh
#
## Change directory
## Probably safer than assuming `cd ..`, let's be predictable
#
cd $ROOT_DIR
