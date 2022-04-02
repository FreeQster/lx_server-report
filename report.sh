#!/bin/bash
# See README.md
# Source
source global_vars.sh

#Warnlevels for the e-mail subject (Can be 0=info, 1=warning, 2=critical)
WARNLEVEL=0

write_diskspace
diskspace_check
send_mail
