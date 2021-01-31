#!/bin/bash
# See README.md

### Global_Vars
# Mailserver hostname or address
SMTPSERVER=Mailserver
# Warning treshold percentage for free disk space
DISKSPACE_WARN=80
# Critical treshold percentage for free disk space
DISKSPACE_CRIT=80

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
		echo $PERCENT
		
		if (($PERCENT>=DISKSPACE_WARN));
			then
			if (($WARNLEVEL<1));
				then
				WARNLEVEL=1
				fi
			fi
			
		if (($PERCENT>=DISKSPACE_CRIT));
			then
			if (($WARNLEVEL<2));
				then
				WARNLEVEL=2
				fi
			fi
			
	done < $DF_FILE
}
#write line for mail.txt file, which is the content of the later sent mail

write_diskspace
diskspace_check
echo "Warnlevel = $WARNLEVEL"
 