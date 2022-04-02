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
