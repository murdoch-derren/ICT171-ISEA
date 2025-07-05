#!/bin/bash

DATENOW=$(date +%F_%H%M%S) #yyyy-mm-dd_hhmmss
LOGDATE=$(date +"%FT%H:%M:%S")
BASEPATH="/root/backup-script"
BACKUP_FOLDER="$BASEPATH/b"
LOGFILE="$BASEPATH/tar.log"
REMOTE="remote-ip-or-url-here"
KEYFILE="$BASEPATH/remote.pem"

if ! [[ -f $KEYFILE ]]; then
	echo "$LOGDATE: WARNING: Private key for $REMOTE not found!" >> $LOGFILE
fi

# keep only the last $N log lines
N=50

if [[ $(wc -l $LOGFILE | cut -d ' ' -f 1) -gt $N ]]; then
	T_LINES=$(( $(wc -l $LOGFILE | cut -d ' ' -f 1) - $N )) # calculate number of lines to reduce
	sed -i "1,$T_LINES d" $LOGFILE # cut from 1st line to T_LINES
	echo "$LOGDATE: Log file truncated." >> $LOGFILE
fi

# check if script args exist
if [[ $# -lt 1 ]]; then
	echo "$LOGDATE: No file or folder was specified for the backup." >> $LOGFILE
	exit
elif [[ $# -gt 1 ]]; then
	echo "$LOGDATE: More than one file or folder was specified for the backup." >> $LOGFILE
	exit
fi

# get input file or folder
INPUT=$1

# check if file or folder exists
if ! [[ -d $INPUT || -f $INPUT ]]; then
	echo "$LOGDATE: File or folder not found. Aborting." >> $LOGFILE
	exit
else
	TARFILE="$BACKUP_FOLDER/$DATENOW.tar.gz"

	# backup folder contents if it's a directory
	if [[ -d $INPUT ]]; then
		tar czf $TARFILE $INPUT/* > /dev/null
	else
		tar czf $TARFILE $INPUT > /dev/null
	fi
fi

if [[ $? == 0 ]]; then 
	echo "$LOGDATE: $INPUT compressed to $TARFILE." >> $LOGFILE
else
	echo "$LOGDATE: Compression failed." >> $LOGFILE
	rm -f $TARFILE
	exit
fi

echo "$LOGDATE: Uploading $INPUT to $REMOTE." >> $LOGFILE

scp -i $KEYFILE $TARFILE ubuntu@$REMOTE:~

if [[ $? == 0 ]]; then 
	echo "$LOGDATE: $INPUT uploaded to $REMOTE." >> $LOGFILE
else
	echo "$LOGDATE: Upload failed." >> $LOGFILE
fi
