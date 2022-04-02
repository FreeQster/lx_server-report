choose_path(){
  # Configure install path
  echo "Please enter install path (Default=/sc/lx_server-report):"
  read $INSTALL_PATH

  if [ -z "$INSTALL_PATH" ];
  then
    INSTALL_PATH='/sc/lx_server-report'
  fi
}
