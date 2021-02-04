#!/bin/bash

# Vars
$INSTALL_PATH

root_check(){
  # Check if the script was started as root
  USER_ID=$(id -u)
  if [[ $USER_ID != "0" ]];
  then
    echo "You are not root - EXITING"
    exit 1
  fi
}

choose_path(){
  # Configure install path
  echo "Please enter install path (Default=/sc/lx_server-report):"
  read $INSTALL_PATH

  if [ -z "$INSTALL_PATH" ];
  then
    INSTALL_PATH='/sc/lx_server-report'
  fi
}

get_files(){
  # Download and prepare the script files
  wget -O /tmp/lx_server-report.zip https://github.com/FreeQster/lx_server-report/archive/main.zip
  unzip -d /tmp/ /tmp/lx_server-report.zip

  # Create install dir
  mkdir -p $INSTALL_PATH

  # Copy files
  cp /tmp/lx_server-report-main/report.sh $INSTALL_PATH/
  cp /tmp/lx_server-report-main/README.md $INSTALL_PATH/
  cp /tmp/lx_server-report-main/example_config.sh $INSTALL_PATH/
  cp $INSTALL_PATH/example_config.sh $INSTALL_PATH/config.sh

  # Make the script executable, just to be sure
  chmod +x $INSTALL_PATH/report.sh
}

add_cron(){
  # Adds a cron file in /etc/cron.d, we want the script to run every 5 minutes
  touch lx_server-report_cron
  echo "# Entry for the lx_server-report script in $INSTALL_PATH" | tee -a lx_server-report_cron
  echo "*/5 * * * * root  /bin/bash -c "$INSTALL_PATH/report.sh"" | tee -a lx_server-report_cron
  mv -f ./lx_server-report_cron /etc/cron.d/lx_server-report
}

root_check
choose_path
get_files
add_cron

echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "Installation successfull!!!"
echo "Please dont forget to edit $INSTALL_PATH/config.sh"
