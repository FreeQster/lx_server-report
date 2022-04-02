diskspace_check() {
	#Checks for the free space values in $DF_FILE
	while read LINE; do
		POS_PERCENT=`expr index "$LINE" %`
		PERCENT=${LINE:$POS_PERCENT-4:3}

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
