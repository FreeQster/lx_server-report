add_cron(){
  # Adds a cron file in /etc/cron.d, we want the script to run every 5 minutes
  touch lx_server-report_cron
  echo "# Entry for the lx_server-report script in $INSTALL_PATH" | tee -a lx_server-report_cron
  echo "*/5 * * * * root  /bin/bash -c "$INSTALL_PATH/report.sh"" | tee -a lx_server-report_cron
  mv -f ./lx_server-report_cron /etc/cron.d/lx_server-report
}
