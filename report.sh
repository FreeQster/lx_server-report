#!/bin/bash
# See README.md

source config.sh

#Warnlevels for the e-mail subject (Can be 0=info, 1=warning, 2=critical)
WARNLEVEL=0


DF_FILE="./df.txt"

write_diskspace() {
	df -h > $DF_FILE
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


write_diskspace
diskspace_check
send_mail
