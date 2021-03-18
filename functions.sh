### install.sh
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

### report.sh
write_diskspace() {
	df -h > $DF_FILE
}

run_count() {
	# Count the number of runs
	touch $RUN_COUNT
	i=`cat $RUN_COUNT`
	i=$((i+1))
	echo $i | tee $RUN_COUNT
}

collect_load_average() {
	# Get load average once per run and write it to LOAD_FILE
	cat /proc/loadavg >> $LOAD_FILE
}

diskspace_check() {
	#Checks for the free space values in $DF_FILE
	while read LINE; do
		POS_PERCENT=`expr index "$LINE" %`
		PERCENT=${LINE:$POS_PERCENT-4:3}
		#echo $PERCENT

		if (($PERCENT>=$DISKSPACE_WARN));
		then
			if (($WARNLEVEL<1));
			then
				WARNLEVEL=1
			fi
		fi

		if (($PERCENT>=$DISKSPACE_CRIT));
		then
			if (($WARNLEVEL<2));
			then
				WARNLEVEL=2
			fi
		fi

	done < $DF_FILE
}

send_mail() {
	if (($WARNLEVEL == 1));
	then
		mail -s "WARNING - Disk-Usage over $DISKSPACE_WARN percent" $MAIL_TO < ./df.txt


	elif (($WARNLEVEL == 2));
	then
		mail -s "CRITICAL - Disk-Usage over $DISKSPACE_CRIT percent" $MAIL_TO < ./df.txt
	fi
}
