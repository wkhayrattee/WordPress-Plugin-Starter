#!/usr/bin/env bash
##
### @author Wasseem Khayrattee <github@wk.contact>
### @github wkhayrattee
##
export DEBIAN_FRONTEND=noninteractive
##
### get current dir path for our main git repo
### this is one-step before folder `bin`
##
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$( cd "$( dirname "$SCRIPT_DIR" )" >/dev/null 2>&1 && pwd )"

source $ROOT_DIR/plugin-env.sh
source $BIN_DIR/env.sh

## Change directory
## Probably safer than assuming `cd ..`, let's be predictable
cd $ROOT_DIR
