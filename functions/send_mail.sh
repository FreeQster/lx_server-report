send_mail() {
	if (($WARNLEVEL == 1));
	then
		mail -s "WARNING - Disk-Usage over $DISKSPACE_WARN percent" $MAIL_TO < ./df.txt


	elif (($WARNLEVEL == 2));
	then
		mail -s "CRITICAL - Disk-Usage over $DISKSPACE_CRIT percent" $MAIL_TO < ./df.txt
	fi
}
