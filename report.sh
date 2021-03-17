#!/bin/bash
# See README.md

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/config.sh

#Warnlevels for the e-mail subject (Can be 0=info, 1=warning, 2=critical)
WARNLEVEL=0


DF_FILE="$SCRIPTPATH/df.txt"
LOAD_FILE="$SCRIPTPATH/load.txt"
RUN_COUNT="$SCRIPTPATH/run_count.txt"

write_diskspace
diskspace_check
send_mail
run_count
