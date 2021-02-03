#!/bin/bash

# Vars
$INSTALL_PATH

root_check(){
  USER_ID=$(id -u)
  if [[ $USER_ID != "0" ]];
  then
    echo "You are not root - EXITING"
    exit 1
  fi
}

choose_path(){
  echo "Please enter install path (Default=/sc/lx_server-report):"
  read $INSTALL_PATH

  if [ -z "$INSTALL_PATH" ];
  then
    INSTALL_PATH='/sc/lx_server-report'
  fi
}

get_files(){
  
}

root_check
choose_path
echo $INSTALL_PATH
## Download archive
#wget -O lx_server-report.zip https://github.com/FreeQster/lx_server-report/archive/main.zip
## Unzip archive
#unzip lx_server-report.zip
## Remove archive
#rm lx_server-report.zip
#
## Rename script directory
#mv lx_server-report-main lx_server-report
## Change working dir to script directory
#cd lx_server-report
#
## Grab path
#SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
#
#
#
#echo "Please dont forget to edit $SCRIPTPATH/config.sh"
