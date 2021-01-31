#!/bin/bash
# See README.md

# Global_Vars
SMTPSERVER=Mailserver
# Warning treshold percentage for free disk space
DISKSPACE_WARN=Number
#The Warnlevel for the e-mail subject (Can be info, warning, critical)
WARNLEVEL=info

df_file="./df.txt"

write_diskspace() {
	df -h > $df_file
}

#diskspace_check() {
#Checks for the free space values in $df_file
#}


#line by line
#count from 100% to zero or reverse?
#write line for mail.txt file, which is the content of the later sent mail

write_diskspace
